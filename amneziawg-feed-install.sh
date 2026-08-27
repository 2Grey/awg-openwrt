#!/bin/sh

# Install AmneziaWG from the signed awg-openwrt package feed.
# Keep this script compatible with BusyBox ash used by OpenWrt.

FEED_ROOT="https://2grey.github.io/awg-openwrt"
LEGACY_FEED_PATTERN="slava-shchipunov.github.io/awg-openwrt"
LEGACY_FEED_SED_PATTERN="slava-shchipunov\.github\.io/awg-openwrt"
INSTALL_TRANSLATION=0
TEMP_KEY=""

APK_REPOSITORIES_FILE=${APK_REPOSITORIES_FILE:-/etc/apk/repositories}
APK_REPOSITORIES_DIR=${APK_REPOSITORIES_DIR:-/etc/apk/repositories.d}
APK_KEY_DIR=${APK_KEY_DIR:-/etc/apk/keys}
OPKG_FEED_CONFIG=${OPKG_FEED_CONFIG:-/etc/opkg/customfeeds.conf}
LUCI_PROTOCOL_FILE=${LUCI_PROTOCOL_FILE:-/www/luci-static/resources/protocol/amneziawg.js}

info() {
    printf '\033[32;1m%s\033[0m\n' "$*"
}

error() {
    printf '\033[31;1m%s\033[0m\n' "$*" >&2
}

die() {
    error "$1"
    exit 1
}

usage() {
    cat <<EOF
Usage: ${0##*/} [-r] [-h]
    -r    also install the Russian LuCI translation
    -h    show this help

The script detects the exact OpenWrt version and target, configures the
signed awg-openwrt feed, and installs AmneziaWG packages from it.
EOF
}

cleanup() {
    if [ -n "$TEMP_KEY" ] && [ -f "$TEMP_KEY" ]; then
        rm -f "$TEMP_KEY"
    fi
}

is_package_installed() {
    case "$PACKAGE_MANAGER" in
        apk) apk info -e "$1" >/dev/null 2>&1 ;;
        opkg) opkg status "$1" 2>/dev/null | grep -q '^Status: .* installed$' ;;
        *) return 1 ;;
    esac
}

remove_package() {
    case "$PACKAGE_MANAGER" in
        apk) apk del "$1" ;;
        opkg) opkg remove "$1" ;;
        *) return 1 ;;
    esac
}

remove_legacy_feed_from_file() {
    LEGACY_CONFIG_FILE=$1
    [ -f "$LEGACY_CONFIG_FILE" ] || return 0
    grep -F -q "$LEGACY_FEED_PATTERN" "$LEGACY_CONFIG_FILE" 2>/dev/null || return 0

    if [ "${LEGACY_FEED_NOTICE_SHOWN:-0}" -eq 0 ]; then
        info "Legacy awg-openwrt feed detected. It will be removed to avoid package and signing-key conflicts:"
        LEGACY_FEED_NOTICE_SHOWN=1
    fi
    printf '  %s\n' "$LEGACY_CONFIG_FILE"
    LEGACY_TEMP_FILE="${LEGACY_CONFIG_FILE}.awg-migrate.$$"
    if ! sed "\\|$LEGACY_FEED_SED_PATTERN|d" "$LEGACY_CONFIG_FILE" > "$LEGACY_TEMP_FILE" ||
        ! cat "$LEGACY_TEMP_FILE" > "$LEGACY_CONFIG_FILE"; then
        rm -f "$LEGACY_TEMP_FILE"
        die "Unable to remove the legacy feed from $LEGACY_CONFIG_FILE."
    fi
    rm -f "$LEGACY_TEMP_FILE"
}

remove_legacy_feeds() {
    LEGACY_FEED_NOTICE_SHOWN=0

    remove_legacy_feed_from_file "$OPKG_FEED_CONFIG"
    remove_legacy_feed_from_file "$APK_REPOSITORIES_FILE"
    for LEGACY_CONFIG_FILE in "$APK_REPOSITORIES_DIR"/*.list; do
        remove_legacy_feed_from_file "$LEGACY_CONFIG_FILE"
    done
}

remove_conflicting_luci_package() {
    DESIRED_LUCI_PACKAGE=$1
    case "$DESIRED_LUCI_PACKAGE" in
        luci-proto-amneziawg) CONFLICTING_LUCI_PACKAGE="luci-app-amneziawg" ;;
        luci-app-amneziawg) CONFLICTING_LUCI_PACKAGE="luci-proto-amneziawg" ;;
        *) die "Unsupported LuCI package: $DESIRED_LUCI_PACKAGE" ;;
    esac

    if is_package_installed "$CONFLICTING_LUCI_PACKAGE"; then
        info "$CONFLICTING_LUCI_PACKAGE conflicts with $DESIRED_LUCI_PACKAGE and will be removed before installation."
        remove_package "$CONFLICTING_LUCI_PACKAGE" ||
            die "Unable to remove conflicting package $CONFLICTING_LUCI_PACKAGE."
    fi
}

upgrade_installed_apk_packages() {
    APK_UPGRADE_PACKAGES=""
    for APK_PACKAGE_NAME in \
        amneziawg-tools \
        kmod-amneziawg \
        luci-proto-amneziawg \
        luci-i18n-amneziawg-ru; do
        if is_package_installed "$APK_PACKAGE_NAME"; then
            APK_UPGRADE_PACKAGES="$APK_UPGRADE_PACKAGES $APK_PACKAGE_NAME"
        fi
    done

    if [ -n "$APK_UPGRADE_PACKAGES" ]; then
        info "Migrating installed AmneziaWG packages to versions available from the new feed..."
        # --available resets version and identity-hash constraints left by
        # installation from local APK files.
        # shellcheck disable=SC2086
        apk upgrade --available $APK_UPGRADE_PACKAGES ||
            die "Unable to migrate installed AmneziaWG packages to the new feed."
    fi
}

verify_luci_parser() {
    if [ ! -r "$LUCI_PROTOCOL_FILE" ]; then
        die "Installed LuCI parser was not found at $LUCI_PROTOCOL_FILE."
    fi

    # LuCI minifies packaged JavaScript, so do not depend on whitespace or
    # the exact call expression used in the source file.
    if ! grep -q 'validateUint16Range' "$LUCI_PROTOCOL_FILE"; then
        die "The LuCI parser on disk is outdated and does not accept AWG 3.x PersistentKeepalive ranges. Reinstall luci-proto-amneziawg and run this installer again."
    fi

    info "Verified the installed AWG 3.x LuCI parser."
}

print_post_install_instructions() {
    info "Reboot the router before using the updated AmneziaWG kernel module."
    info "After reboot, hard-refresh LuCI (Ctrl+F5) or open it in a private browser window to avoid cached JavaScript."
}

parse_options() {
    while getopts ":hr" OPTION; do
        case "$OPTION" in
            h)
                usage
                exit 0
                ;;
            r) INSTALL_TRANSLATION=1 ;;
            \?)
                error "Unknown option: -$OPTARG"
                usage >&2
                exit 1
                ;;
        esac
    done
    shift "$((OPTIND - 1))"
    [ "$#" -eq 0 ] || die "Unexpected positional arguments."
}

detect_release() {
    VERSION=""
    RELEASE_TARGET=""

    if command -v ubus >/dev/null 2>&1 && command -v jsonfilter >/dev/null 2>&1; then
        BOARD_INFO=$(ubus call system board 2>/dev/null)
        if [ -n "$BOARD_INFO" ]; then
            VERSION=$(printf '%s\n' "$BOARD_INFO" | jsonfilter -e '@.release.version' 2>/dev/null)
            RELEASE_TARGET=$(printf '%s\n' "$BOARD_INFO" | jsonfilter -e '@.release.target' 2>/dev/null)
        fi
    fi

    if [ -f /etc/openwrt_release ]; then
        if [ -z "$VERSION" ]; then
            VERSION=$(sed -n "s/^DISTRIB_RELEASE=['\"]\{0,1\}\([^'\"]*\)['\"]\{0,1\}$/\1/p" /etc/openwrt_release | head -n 1)
        fi
        if [ -z "$RELEASE_TARGET" ]; then
            RELEASE_TARGET=$(sed -n "s/^DISTRIB_TARGET=['\"]\{0,1\}\([^'\"]*\)['\"]\{0,1\}$/\1/p" /etc/openwrt_release | head -n 1)
        fi
    fi

    [ -n "$VERSION" ] || die "Unable to detect the OpenWrt version."
    [ -n "$RELEASE_TARGET" ] || die "Unable to detect the OpenWrt target."

    case "$VERSION" in
        *[!0-9A-Za-z._-]*) die "Unsafe OpenWrt version value: $VERSION" ;;
    esac

    case "$RELEASE_TARGET" in
        */*) ;;
        *) die "Unexpected OpenWrt target value: $RELEASE_TARGET" ;;
    esac

    TARGET=${RELEASE_TARGET%%/*}
    SUBTARGET=${RELEASE_TARGET#*/}
    case "$TARGET/$SUBTARGET" in
        ''/* | */'' | *[!0-9A-Za-z_/-]*) die "Unsafe OpenWrt target value: $RELEASE_TARGET" ;;
        */*/*) die "Unexpected OpenWrt target value: $RELEASE_TARGET" ;;
    esac

    FEED_URL="$FEED_ROOT/$VERSION/$TARGET/$SUBTARGET"
    info "OpenWrt: $VERSION, target: $TARGET/$SUBTARGET"
    info "Feed: $FEED_URL"
}

detect_package_manager() {
    if command -v apk >/dev/null 2>&1; then
        PACKAGE_MANAGER="apk"
    elif command -v opkg >/dev/null 2>&1; then
        PACKAGE_MANAGER="opkg"
    else
        die "No supported package manager found (apk or opkg)."
    fi
}

install_with_opkg() {
    command -v opkg-key >/dev/null 2>&1 || die "opkg-key is required to add the feed signing key."

    TEMP_KEY="/tmp/awg-openwrt-feed.$$.pub"
    info "Downloading and installing the feed signing key..."
    wget -q -O "$TEMP_KEY" "$FEED_ROOT/keys/awg-openwrt-feed.pub" ||
        die "Unable to download the feed signing key."
    [ -s "$TEMP_KEY" ] || die "The downloaded feed signing key is empty."
    opkg-key add "$TEMP_KEY" >/dev/null || die "Unable to install the feed signing key."

    mkdir -p "${OPKG_FEED_CONFIG%/*}" || die "Unable to create the opkg configuration directory."
    [ -f "$OPKG_FEED_CONFIG" ] || : > "$OPKG_FEED_CONFIG"
    sed -i '\|^[[:space:]]*src/gz[[:space:]][[:space:]]*awg[[:space:]]|d' "$OPKG_FEED_CONFIG" ||
        die "Unable to update $OPKG_FEED_CONFIG."
    printf 'src/gz awg %s\n' "$FEED_URL" >> "$OPKG_FEED_CONFIG" ||
        die "Unable to write $OPKG_FEED_CONFIG."

    info "Updating package indexes..."
    opkg update || die "Unable to update package indexes. Check that a feed exists for this exact OpenWrt build."

    remove_conflicting_luci_package "luci-proto-amneziawg"
    info "Installing AmneziaWG packages..."
    if [ "$INSTALL_TRANSLATION" -eq 1 ]; then
        opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg luci-i18n-amneziawg-ru ||
            die "Unable to install AmneziaWG packages."
    else
        opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg ||
            die "Unable to install AmneziaWG packages."
    fi
}

install_with_apk() {
    REPOSITORY_CONFIG="$APK_REPOSITORIES_DIR/customfeeds.list"
    TEMP_KEY="/tmp/awg-openwrt-feed.$$.pem"

    mkdir -p "$APK_KEY_DIR" "$APK_REPOSITORIES_DIR" || die "Unable to create APK configuration directories."
    info "Downloading and installing the feed signing key..."
    wget -q -O "$TEMP_KEY" "$FEED_ROOT/keys/awg-openwrt-feed.pem" ||
        die "Unable to download the feed signing key."
    [ -s "$TEMP_KEY" ] || die "The downloaded feed signing key is empty."
    mv "$TEMP_KEY" "$APK_KEY_DIR/awg-openwrt-feed.pem" || die "Unable to install the feed signing key."
    TEMP_KEY=""

    [ -f "$REPOSITORY_CONFIG" ] || : > "$REPOSITORY_CONFIG"
    sed -i '\|^[[:space:]]*https://2grey\.github\.io/awg-openwrt/.*packages\.adb[[:space:]]*$|d' "$REPOSITORY_CONFIG" ||
        die "Unable to update $REPOSITORY_CONFIG."
    printf '%s/packages.adb\n' "$FEED_URL" >> "$REPOSITORY_CONFIG" ||
        die "Unable to write $REPOSITORY_CONFIG."

    info "Updating package indexes..."
    apk update || die "Unable to update package indexes. Check that a feed exists for this exact OpenWrt build."

    remove_conflicting_luci_package "luci-proto-amneziawg"
    upgrade_installed_apk_packages

    info "Installing AmneziaWG packages..."
    if [ "$INSTALL_TRANSLATION" -eq 1 ]; then
        apk add --upgrade --latest amneziawg-tools kmod-amneziawg luci-proto-amneziawg luci-i18n-amneziawg-ru ||
            die "Unable to install AmneziaWG packages."
    else
        apk add --upgrade --latest amneziawg-tools kmod-amneziawg luci-proto-amneziawg ||
            die "Unable to install AmneziaWG packages."
    fi
}

main() {
    parse_options "$@"
    [ "$(id -u)" -eq 0 ] || die "Run this script as root."
    command -v wget >/dev/null 2>&1 || die "wget is required."

    detect_release
    detect_package_manager
    # Remove the old source before replacing its identically named public key.
    remove_legacy_feeds

    case "$PACKAGE_MANAGER" in
        opkg) install_with_opkg ;;
        apk) install_with_apk ;;
    esac

    verify_luci_parser
    info "AmneziaWG packages installed successfully."
    info "The feed remains configured and will be used for package updates."
    print_post_install_instructions
}

trap cleanup EXIT
trap 'exit 1' HUP INT TERM

if [ "${AMNEZIAWG_FEED_INSTALL_SOURCE_ONLY:-0}" != "1" ]; then
    main "$@"
fi
