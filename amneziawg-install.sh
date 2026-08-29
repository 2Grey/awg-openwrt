#!/bin/sh

# Installer for stable OpenWrt releases. Keep this script compatible with
# BusyBox ash: it is commonly executed directly on a router with /bin/sh.

PKG_MANAGER=""
PKG_EXT=""
AWG_DIR=""
AWG_VERSION="1.0"
AWG_PROFILE="auto"
CONFIG_FILE=""
INTERFACE_NAME="awg1"
LEGACY_FEED_PATTERN="slava-shchipunov.github.io/awg-openwrt"
LEGACY_FEED_SED_PATTERN="slava-shchipunov\.github\.io/awg-openwrt"

APK_REPOSITORIES_FILE=${APK_REPOSITORIES_FILE:-/etc/apk/repositories}
APK_REPOSITORIES_DIR=${APK_REPOSITORIES_DIR:-/etc/apk/repositories.d}
OPKG_FEED_CONFIG=${OPKG_FEED_CONFIG:-/etc/opkg/customfeeds.conf}
LUCI_PROTOCOL_FILE=${LUCI_PROTOCOL_FILE:-/www/luci-static/resources/protocol/amneziawg.js}

ASK_FOR_TRANSLATION=1
ASK_FOR_INTERFACE_CONFIG=1
SKIP_PACKAGE_INSTALL=0

print_info() {
    printf '\033[32;1m%s\033[0m\n' "$*"
}

print_error() {
    printf '\033[31;1m%s\033[0m\n' "$*" >&2
}

die() {
    print_error "$1"
    exit 1
}

usage() {
    cat <<EOF
Usage: ${0##*/} [-h] [-e] [-n] [-s] [-a 2.0|3.0|3.1|auto] [-c FILE] [-i NAME]
    -h    show this help
    -e    do not install 'luci-i18n-amneziawg-ru' package
    -n    do not configure the amneziawg interface
    -s    skip package installation and use the installed AmneziaWG packages
    -a    connection profile: 2.0, 3.0, 3.1, or auto (default: auto)
    -c    import connection settings from an AmneziaWG .conf file
    -i    OpenWrt interface name (default: awg1)

An installed AWG 3.1 stack is backwards-compatible with 2.0 and 3.0
connection profiles. In auto mode, FILE is inspected for version-specific
settings; without FILE, the script asks which profile to configure.
EOF
}

parse_options() {
    while getopts ":a:c:ehi:ns" OPT; do
        case "$OPT" in
            h)
                usage
                exit 0
                ;;
            e) ASK_FOR_TRANSLATION=0 ;;
            n) ASK_FOR_INTERFACE_CONFIG=0 ;;
            a) AWG_PROFILE=$OPTARG ;;
            c) CONFIG_FILE=$OPTARG ;;
            i) INTERFACE_NAME=$OPTARG ;;
            s) SKIP_PACKAGE_INSTALL=1 ;;
            :)
                printf 'Option -%s requires an argument\n' "$OPTARG" >&2
                usage >&2
                exit 1
                ;;
            \?)
                printf 'Unknown option -%s\n' "$OPTARG" >&2
                usage >&2
                exit 1
                ;;
        esac
    done
    shift "$((OPTIND - 1))"

    [ "$#" -eq 0 ] || die "Unexpected positional arguments."

    case "$AWG_PROFILE" in
        auto | 2.0 | 3.0 | 3.1) ;;
        *) die "Unsupported AWG profile: $AWG_PROFILE (expected 2.0, 3.0, 3.1, or auto)." ;;
    esac

    case "$INTERFACE_NAME" in
        '' | *[!A-Za-z0-9_]*) die "Invalid interface name: $INTERFACE_NAME" ;;
    esac

    if [ -n "$CONFIG_FILE" ]; then
        [ "$ASK_FOR_INTERFACE_CONFIG" -eq 1 ] || die "Options -c and -n cannot be used together."
        [ -r "$CONFIG_FILE" ] || die "Configuration file is not readable: $CONFIG_FILE"
    fi
}

cleanup_downloads() {
    case "$AWG_DIR" in
        /tmp/amneziawg.*)
            rm -rf "$AWG_DIR"
            AWG_DIR=""
            ;;
    esac
}

detect_package_manager() {
    if command -v apk >/dev/null 2>&1; then
        PKG_MANAGER="apk"
        PKG_EXT="apk"
    elif command -v opkg >/dev/null 2>&1; then
        PKG_MANAGER="opkg"
        PKG_EXT="ipk"
    else
        die "No supported package manager found (apk/opkg)."
    fi
}

pkg_update() {
    case "$PKG_MANAGER" in
        apk) apk update ;;
        opkg) opkg update ;;
        *) die "Unsupported package manager: $PKG_MANAGER" ;;
    esac
}

is_pkg_installed() {
    CHECK_PACKAGE_NAME=$1

    case "$PKG_MANAGER" in
        apk) apk info -e "$CHECK_PACKAGE_NAME" >/dev/null 2>&1 ;;
        opkg) opkg list-installed 2>/dev/null | grep -q "^${CHECK_PACKAGE_NAME} " ;;
        *) die "Unsupported package manager: $PKG_MANAGER" ;;
    esac
}

remove_pkg() {
    REMOVE_PACKAGE_NAME=$1

    case "$PKG_MANAGER" in
        apk) apk del "$REMOVE_PACKAGE_NAME" ;;
        opkg) opkg remove "$REMOVE_PACKAGE_NAME" ;;
        *) die "Unsupported package manager: $PKG_MANAGER" ;;
    esac
}

remove_legacy_feed_from_file() {
    LEGACY_CONFIG_FILE=$1
    [ -f "$LEGACY_CONFIG_FILE" ] || return 0
    grep -F -q "$LEGACY_FEED_PATTERN" "$LEGACY_CONFIG_FILE" 2>/dev/null || return 0

    if [ "${LEGACY_FEED_NOTICE_SHOWN:-0}" -eq 0 ]; then
        print_info "Legacy awg-openwrt feed detected. It will be removed to avoid package and signing-key conflicts:"
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

    if is_pkg_installed "$CONFLICTING_LUCI_PACKAGE"; then
        print_info "$CONFLICTING_LUCI_PACKAGE conflicts with $DESIRED_LUCI_PACKAGE and will be removed before installation."
        remove_pkg "$CONFLICTING_LUCI_PACKAGE" ||
            die "Unable to remove conflicting package $CONFLICTING_LUCI_PACKAGE."
    fi
}

install_local_pkg() {
    PACKAGE_FILE=$1

    case "$PKG_MANAGER" in
        apk) apk add --allow-untrusted "$PACKAGE_FILE" ;;
        opkg) opkg install "$PACKAGE_FILE" ;;
        *) die "Unsupported package manager: $PKG_MANAGER" ;;
    esac
}

get_pkgarch() {
    PKGARCH_UBUS=$(ubus call system board 2>/dev/null | jsonfilter -e '@.release.arch' 2>/dev/null)
    if [ -n "$PKGARCH_UBUS" ]; then
        printf '%s\n' "$PKGARCH_UBUS"
        return
    fi

    if command -v opkg >/dev/null 2>&1; then
        opkg print-architecture |
            awk 'BEGIN { max = 0 } $3 > max { max = $3; arch = $2 } END { print arch }'
        return
    fi

    if [ -f /etc/openwrt_release ]; then
        PKGARCH_RELEASE=$(sed -n "s/^DISTRIB_ARCH='\([^']*\)'/\1/p" /etc/openwrt_release)
        if [ -n "$PKGARCH_RELEASE" ]; then
            printf '%s\n' "$PKGARCH_RELEASE"
            return
        fi
    fi

    if command -v apk >/dev/null 2>&1; then
        apk --print-arch
        return
    fi

    uname -m
}

download_package() {
    DOWNLOAD_PACKAGE_NAME=$1
    DOWNLOAD_POSTFIX=$2
    DOWNLOAD_DIR=$3
    DOWNLOAD_BASE_URL=$4

    DOWNLOAD_FILE="${DOWNLOAD_PACKAGE_NAME}${DOWNLOAD_POSTFIX}.${PKG_EXT}"
    if wget -O "$DOWNLOAD_DIR/$DOWNLOAD_FILE" "${DOWNLOAD_BASE_URL}${DOWNLOAD_FILE}" &&
        [ -s "$DOWNLOAD_DIR/$DOWNLOAD_FILE" ]; then
        printf '%s\n' "$DOWNLOAD_FILE"
        return 0
    fi
    rm -f "$DOWNLOAD_DIR/$DOWNLOAD_FILE"

    case "$PKG_EXT" in
        apk) DOWNLOAD_FALLBACK_EXT="ipk" ;;
        ipk) DOWNLOAD_FALLBACK_EXT="apk" ;;
        *) die "Unsupported package extension: $PKG_EXT" ;;
    esac

    DOWNLOAD_FILE="${DOWNLOAD_PACKAGE_NAME}${DOWNLOAD_POSTFIX}.${DOWNLOAD_FALLBACK_EXT}"
    if wget -O "$DOWNLOAD_DIR/$DOWNLOAD_FILE" "${DOWNLOAD_BASE_URL}${DOWNLOAD_FILE}" &&
        [ -s "$DOWNLOAD_DIR/$DOWNLOAD_FILE" ]; then
        printf '%s\n' "$DOWNLOAD_FILE"
        return 0
    fi
    rm -f "$DOWNLOAD_DIR/$DOWNLOAD_FILE"

    return 1
}

# The OpenWrt repository must be available for kmod-amneziawg dependencies.
check_repo() {
    print_info "Checking OpenWrt repo availability..."

    if ! REPO_UPDATE_OUTPUT=$(pkg_update 2>&1); then
        die "${PKG_MANAGER} failed. Check internet or date. Command for force ntp sync: ntpd -p ptbtime1.ptb.de"
    fi

    if printf '%s\n' "$REPO_UPDATE_OUTPUT" | grep -q 'Failed to download'; then
        die "${PKG_MANAGER} failed. Check internet or date. Command for force ntp sync: ntpd -p ptbtime1.ptb.de"
    fi
}

detect_base_awg_version() {
    AWG_VERSION="1.0"
    LUCI_PACKAGE_NAME="luci-app-amneziawg"

    VERSION_MAJOR=$(printf '%s\n' "$VERSION" | cut -d '.' -f 1)
    VERSION_MINOR=$(printf '%s\n' "$VERSION" | cut -d '.' -f 2)
    VERSION_PATCH=$(printf '%s\n' "$VERSION" | cut -d '.' -f 3)

    case "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}" in
        *[!0-9.]* | *..*) return ;;
    esac
    [ -n "$VERSION_MAJOR" ] && [ -n "$VERSION_MINOR" ] && [ -n "$VERSION_PATCH" ] || return

    if [ "$VERSION_MAJOR" -gt 24 ] ||
        { [ "$VERSION_MAJOR" -eq 24 ] && [ "$VERSION_MINOR" -gt 10 ]; } ||
        { [ "$VERSION_MAJOR" -eq 24 ] && [ "$VERSION_MINOR" -eq 10 ] && [ "$VERSION_PATCH" -ge 3 ]; } ||
        { [ "$VERSION_MAJOR" -eq 23 ] && [ "$VERSION_MINOR" -eq 5 ] && [ "$VERSION_PATCH" -ge 6 ]; }; then
        AWG_VERSION="2.0"
        LUCI_PACKAGE_NAME="luci-proto-amneziawg"
    fi
}

install_release_package() {
    INSTALL_PACKAGE_NAME=$1

    if is_pkg_installed "$INSTALL_PACKAGE_NAME"; then
        printf '%s already installed; updating from the selected release\n' "$INSTALL_PACKAGE_NAME"
    fi

    if ! INSTALL_PACKAGE_FILE=$(
        download_package \
            "$INSTALL_PACKAGE_NAME" \
            "$PKGPOSTFIX_BASE" \
            "$AWG_DIR" \
            "${BASE_URL}v${VERSION}/"
    ); then
        die "Error downloading ${INSTALL_PACKAGE_NAME} from GitHub release v${VERSION}. Review the wget errors above and check access to GitHub release assets, the system date, and free space in /tmp."
    fi
    printf '%s file downloaded successfully\n' "$INSTALL_PACKAGE_NAME"

    if ! install_local_pkg "$AWG_DIR/$INSTALL_PACKAGE_FILE"; then
        die "Error installing ${INSTALL_PACKAGE_NAME}. Please, install ${INSTALL_PACKAGE_NAME} manually and run the script again"
    fi
    printf '%s installed successfully\n' "$INSTALL_PACKAGE_NAME"
}

install_translation_package() {
    TRANSLATION_PACKAGE_NAME="luci-i18n-amneziawg-ru"

    if is_pkg_installed "$TRANSLATION_PACKAGE_NAME"; then
        printf '%s already installed\n' "$TRANSLATION_PACKAGE_NAME"
        return
    fi

    if ! TRANSLATION_PACKAGE_FILE=$(
        download_package \
            "$TRANSLATION_PACKAGE_NAME" \
            "$PKGPOSTFIX_BASE" \
            "$AWG_DIR" \
            "${BASE_URL}v${VERSION}/"
    ); then
        printf 'Warning: Russian localization not available for this version/platform (non-critical)\n'
        return
    fi
    printf '%s file downloaded successfully\n' "$TRANSLATION_PACKAGE_NAME"

    if install_local_pkg "$AWG_DIR/$TRANSLATION_PACKAGE_FILE"; then
        printf '%s installed successfully\n' "$TRANSLATION_PACKAGE_NAME"
    else
        printf 'Warning: Error installing %s (non-critical)\n' "$TRANSLATION_PACKAGE_NAME"
    fi
}

ask_yes_no() {
    QUESTION=$1
    DEFAULT_ANSWER=${2-}

    print_info "$QUESTION"
    if ! IFS= read -r ANSWER; then
        die "Input aborted."
    fi
    [ -n "$ANSWER" ] || ANSWER=$DEFAULT_ANSWER

    case "$ANSWER" in
        y | Y) return 0 ;;
        *) return 1 ;;
    esac
}

is_awg3() {
    case "$AWG_PROFILE" in
        3.*) return 0 ;;
        *) return 1 ;;
    esac
}

awg_version_rank() {
    case "$1" in
        3.1) printf '31\n' ;;
        3.0) printf '30\n' ;;
        2.0) printf '20\n' ;;
        *) printf '0\n' ;;
    esac
}

detect_installed_awg_version() {
    AWG_TOOLS_VERSION=$(awg --version 2>/dev/null || true)
    case "$AWG_TOOLS_VERSION" in
        *'amneziawg-tools v3.1.'*) AWG_VERSION="3.1" ;;
        *'amneziawg-tools v3.0.'*) AWG_VERSION="3.0" ;;
    esac
}

extract_last_awg_release_from_log() {
    sed -n 's/.*amneziawg: AmneziaWG \([^[:space:]]*\) loaded\..*/\1/p' |
        tail -n 1
}

awg_profile_from_release() {
    case "$1" in
        3.1 | 3.1.*) printf '3.1\n' ;;
        3.0 | 3.0.*) printf '3.0\n' ;;
        1.* | 2.*) printf '2.0\n' ;;
        *) return 1 ;;
    esac
}

detect_running_awg_version() {
    RUNNING_AWG_VERSION=""
    RUNNING_AWG_IMPLEMENTATION=""
    RUNNING_AWG_RELEASE=""

    if [ ! -e /sys/module/amneziawg ]; then
        modprobe amneziawg >/dev/null 2>&1 || true
    fi

    if [ ! -e /sys/module/amneziawg ]; then
        if command -v amneziawg-go >/dev/null 2>&1; then
            RUNNING_AWG_IMPLEMENTATION="amneziawg-go"
        fi
        return 0
    fi

    RUNNING_AWG_IMPLEMENTATION="kernel module"
    if [ -r /sys/module/amneziawg/version ]; then
        RUNNING_AWG_RELEASE=$(cat /sys/module/amneziawg/version 2>/dev/null || true)
    fi

    # Some OpenWrt builds omit MODULE_VERSION metadata, so sysfs has no
    # version file. The load message still identifies the running module.
    # Take the last match because a module can be replaced without a reboot.
    if [ -z "$RUNNING_AWG_RELEASE" ] && command -v dmesg >/dev/null 2>&1; then
        RUNNING_AWG_RELEASE=$(dmesg 2>/dev/null | extract_last_awg_release_from_log)
    fi

    RUNNING_AWG_VERSION=$(awg_profile_from_release "$RUNNING_AWG_RELEASE" 2>/dev/null || true)
}

config_get_value() {
    CONFIG_SECTION=$1
    CONFIG_KEY=$2

    awk -v wanted_section="$CONFIG_SECTION" -v wanted_key="$CONFIG_KEY" '
        function trim(value) {
            sub(/^[[:space:]]+/, "", value)
            sub(/[[:space:]]+$/, "", value)
            return value
        }
        {
            sub(/\r$/, "")
        }
        /^[[:space:]]*[#;]/ { next }
        /^[[:space:]]*\[/ {
            line = $0
            sub(/^[[:space:]]*\[/, "", line)
            sub(/\][[:space:]]*$/, "", line)
            section = tolower(trim(line))
            if (section == "peer")
                peer_count++
            next
        }
        {
            equals = index($0, "=")
            if (!equals)
                next
            key = tolower(trim(substr($0, 1, equals - 1)))
            value = trim(substr($0, equals + 1))
            if (section == tolower(wanted_section) &&
                key == tolower(wanted_key) &&
                (section != "peer" || peer_count == 1)) {
                print value
                exit
            }
        }
    ' "$CONFIG_FILE"
}

config_has_any() {
    CONFIG_HAS_SECTION=$1
    shift

    for CONFIG_HAS_KEY in "$@"; do
        if [ -n "$(config_get_value "$CONFIG_HAS_SECTION" "$CONFIG_HAS_KEY")" ]; then
            return 0
        fi
    done
    return 1
}

config_has_range() {
    CONFIG_RANGE_SECTION=$1
    shift

    for CONFIG_RANGE_KEY in "$@"; do
        CONFIG_RANGE_VALUE=$(config_get_value "$CONFIG_RANGE_SECTION" "$CONFIG_RANGE_KEY")
        case "$CONFIG_RANGE_VALUE" in
            *-*) return 0 ;;
        esac
    done
    return 1
}

detect_profile_from_config() {
    if config_has_any Interface RandomTrailers DisableCookies; then
        printf '3.1\n'
    elif config_has_any Interface \
        HeaderProtectionKey ContentPaddingAddition RekeyAfterTime RekeyTimeout \
        RejectAfterTime KeepaliveTimeout MaxHandshakeAttempts ||
        config_has_range Interface H1 H2 H3 H4 ||
        config_has_range Peer PersistentKeepalive; then
        printf '3.0\n'
    else
        printf '2.0\n'
    fi
}

select_awg_profile() {
    if [ "$AWG_PROFILE" = "auto" ]; then
        if [ -n "$CONFIG_FILE" ]; then
            AWG_PROFILE=$(detect_profile_from_config)
            print_info "Detected connection profile from config: AWG $AWG_PROFILE"
        else
            while :; do
                read_prompt "Select connection profile (2.0, 3.0, or 3.1) [$AWG_VERSION]:" "$AWG_VERSION"
                case "$READ_VALUE" in
                    2.0 | 3.0 | 3.1)
                        AWG_PROFILE=$READ_VALUE
                        break
                        ;;
                    *) printf 'Expected 2.0, 3.0, or 3.1. Please repeat\n' ;;
                esac
            done
        fi
    fi

    INSTALLED_RANK=$(awg_version_rank "$AWG_VERSION")
    PROFILE_RANK=$(awg_version_rank "$AWG_PROFILE")
    if [ "$INSTALLED_RANK" -lt "$PROFILE_RANK" ]; then
        die "Installed packages provide AWG $AWG_VERSION, but the selected connection requires AWG $AWG_PROFILE. Publish/install matching AWG $AWG_PROFILE packages for this OpenWrt release first."
    fi

    detect_running_awg_version
    if [ "$RUNNING_AWG_IMPLEMENTATION" = "kernel module" ] &&
        [ -z "$RUNNING_AWG_VERSION" ]; then
        die "Unable to determine the active AmneziaWG kernel module version from sysfs or dmesg. Reload the module and run the script again."
    fi
    if [ -n "$RUNNING_AWG_VERSION" ] &&
        [ "$(awg_version_rank "$RUNNING_AWG_VERSION")" -lt "$PROFILE_RANK" ]; then
        die "The active $RUNNING_AWG_IMPLEMENTATION is AWG $RUNNING_AWG_VERSION ($RUNNING_AWG_RELEASE), but profile $AWG_PROFILE requires a newer implementation. The module file may already be newer than the loaded module; if no AWG interface is active, reload it with: rmmod amneziawg && modprobe amneziawg"
    fi

    print_info "Using AWG $AWG_PROFILE connection profile on AWG $AWG_VERSION packages"
}

install_awg_packages() {
    PKGARCH=$(get_pkgarch)
    [ -n "$PKGARCH" ] || die "Unable to detect the package architecture."

    RELEASE_TARGET=$(ubus call system board | jsonfilter -e '@.release.target')
    TARGET=$(printf '%s\n' "$RELEASE_TARGET" | cut -d '/' -f 1)
    SUBTARGET=$(printf '%s\n' "$RELEASE_TARGET" | cut -d '/' -f 2)
    VERSION=$(ubus call system board | jsonfilter -e '@.release.version')
    [ -n "$TARGET" ] && [ -n "$SUBTARGET" ] && [ -n "$VERSION" ] ||
        die "Unable to detect OpenWrt release information."
    print_info "Detected OpenWrt target: $TARGET, subtarget: $SUBTARGET"

    PKGPOSTFIX_BASE="_v${VERSION}_${PKGARCH}_${TARGET}_${SUBTARGET}"
    BASE_URL="https://github.com/2Grey/awg-openwrt/releases/download/"

    detect_base_awg_version
    remove_conflicting_luci_package "$LUCI_PACKAGE_NAME"

    AWG_DIR=$(mktemp -d /tmp/amneziawg.XXXXXX) ||
        die "Unable to create a temporary download directory."

    install_release_package "kmod-amneziawg"
    install_release_package "amneziawg-tools"

    detect_installed_awg_version
    print_info "Detected installed AWG stack: $AWG_VERSION"

    install_release_package "$LUCI_PACKAGE_NAME"

    if [ "$AWG_VERSION" != "1.0" ] && [ "$ASK_FOR_TRANSLATION" -eq 1 ]; then
        if ask_yes_no \
            "Устанавливаем пакет с русской локализацией? Install Russian language pack? (y/N):" \
            "n"; then
            install_translation_package
        else
            print_info "Skipping Russian language pack installation."
        fi
    fi

    cleanup_downloads
}

use_installed_awg_packages() {
    VERSION=$(ubus call system board 2>/dev/null | jsonfilter -e '@.release.version' 2>/dev/null)
    [ -n "$VERSION" ] || die "Unable to detect the OpenWrt version."

    detect_base_awg_version

    for REQUIRED_PACKAGE in kmod-amneziawg amneziawg-tools "$LUCI_PACKAGE_NAME"; do
        if ! is_pkg_installed "$REQUIRED_PACKAGE"; then
            die "Option -s requires the installed package ${REQUIRED_PACKAGE}. Install the complete AmneziaWG package set or run the script without -s."
        fi
    done

    detect_installed_awg_version
    print_info "Skipping package installation; using the installed AWG $AWG_VERSION stack."
}

prepare_awg_packages() {
    if [ "$SKIP_PACKAGE_INSTALL" -eq 1 ]; then
        use_installed_awg_packages
        return
    fi

    remove_legacy_feeds
    check_repo
    install_awg_packages
}

verify_luci_parser() {
    case "$AWG_VERSION" in
        3.0 | 3.1) ;;
        *) return 0 ;;
    esac

    if [ ! -r "$LUCI_PROTOCOL_FILE" ]; then
        die "Installed LuCI parser was not found at $LUCI_PROTOCOL_FILE."
    fi

    # LuCI minifies packaged JavaScript, so do not depend on whitespace or
    # the exact call expression used in the source file.
    if ! grep -q 'validateUint16Range' "$LUCI_PROTOCOL_FILE"; then
        die "The LuCI parser on disk is outdated and does not accept AWG 3.x PersistentKeepalive ranges. Reinstall $LUCI_PACKAGE_NAME and run this installer again."
    fi

    print_info "Verified the installed AWG 3.x LuCI parser."
}

print_post_install_instructions() {
    if [ "$SKIP_PACKAGE_INSTALL" -eq 1 ]; then
        print_info "Package installation was skipped. If an older kernel module was loaded before the packages were replaced manually, reboot the router before using AmneziaWG."
        print_info "Hard-refresh LuCI (Ctrl+F5) or open it in a private browser window to avoid cached JavaScript."
    else
        print_info "Reboot the router before using the updated AmneziaWG kernel module."
        print_info "After reboot, hard-refresh LuCI (Ctrl+F5) or open it in a private browser window to avoid cached JavaScript."
    fi
}

read_prompt() {
    PROMPT_TEXT=$1
    PROMPT_DEFAULT=${2-}

    printf '%s\n' "$PROMPT_TEXT"
    if ! IFS= read -r READ_VALUE; then
        die "Input aborted."
    fi
    [ -n "$READ_VALUE" ] || READ_VALUE=$PROMPT_DEFAULT
}

read_on_off_prompt() {
    ON_OFF_PROMPT=$1
    ON_OFF_DEFAULT=$2

    while :; do
        read_prompt "$ON_OFF_PROMPT" "$ON_OFF_DEFAULT"
        case "$READ_VALUE" in
            on | off) return ;;
            *) printf 'Expected "on" or "off". Please repeat\n' ;;
        esac
    done
}

normalize_on_off() {
    case "$1" in
        on | ON | On | 1) printf 'on\n' ;;
        off | OFF | Off | 0 | '') printf 'off\n' ;;
        *) return 1 ;;
    esac
}

validate_range_setting() {
    RANGE_NAME=$1
    RANGE_VALUE=$2
    RANGE_MAX=$3

    [ -n "$RANGE_VALUE" ] || return 0
    awk -v name="$RANGE_NAME" -v value="$RANGE_VALUE" -v max="$RANGE_MAX" '
        BEGIN {
            if (value !~ /^[0-9]+(-[0-9]+)?$/) {
                printf "%s must be a number or ascending range: %s\n", name, value > "/dev/stderr"
                exit 1
            }
            count = split(value, bounds, "-")
            lower = bounds[1] + 0
            upper = (count == 2 ? bounds[2] : bounds[1]) + 0
            if (lower > upper || upper > max) {
                printf "%s must be between 0 and %s: %s\n", name, max, value > "/dev/stderr"
                exit 1
            }
        }
    ' || die "Invalid $RANGE_NAME value."
}

validate_connection_settings() {
    case "$AWG_ENDPOINT_PORT_INT" in
        '' | *[!0-9]*) die "Endpoint port must be a number." ;;
    esac
    [ "$AWG_ENDPOINT_PORT_INT" -ge 1 ] && [ "$AWG_ENDPOINT_PORT_INT" -le 65535 ] ||
        die "Endpoint port must be between 1 and 65535."

    if [ "$AWG_PROFILE" = "2.0" ]; then
        case "$AWG_H1 $AWG_H2 $AWG_H3 $AWG_H4 $AWG_PERSISTENT_KEEPALIVE" in
            *-*) die "H1-H4 and PersistentKeepalive ranges require profile 3.0 or newer." ;;
        esac
    fi

    validate_range_setting ContentPaddingAddition "$AWG_CONTENT_PADDING_ADDITION" 65535
    validate_range_setting RekeyAfterTime "$AWG_REKEY_AFTER_TIME" 65535
    validate_range_setting RekeyTimeout "$AWG_REKEY_TIMEOUT" 65535
    validate_range_setting RejectAfterTime "$AWG_REJECT_AFTER_TIME" 65535
    validate_range_setting KeepaliveTimeout "$AWG_KEEPALIVE_TIMEOUT" 65535
    validate_range_setting MaxHandshakeAttempts "$AWG_MAX_HANDSHAKE_ATTEMPTS" 65535

    case "$AWG_PERSISTENT_KEEPALIVE" in
        off | '') ;;
        *) validate_range_setting PersistentKeepalive "$AWG_PERSISTENT_KEEPALIVE" 65535 ;;
    esac

    validate_range_setting H1 "$AWG_H1" 4294967295
    validate_range_setting H2 "$AWG_H2" 4294967295
    validate_range_setting H3 "$AWG_H3" 4294967295
    validate_range_setting H4 "$AWG_H4" 4294967295

    if [ -n "$AWG_HEADER_PROTECTION_KEY" ]; then
        for AWG_PADDING in "$AWG_S1" "$AWG_S2" "$AWG_S3" "$AWG_S4"; do
            case "$AWG_PADDING" in
                '' | *[!0-9]*) die "HeaderProtectionKey requires numeric S1-S4 values of at least 12." ;;
            esac
            [ "$AWG_PADDING" -ge 12 ] ||
                die "HeaderProtectionKey requires S1-S4 values of at least 12."
        done
    fi
}

validate_config_profile() {
    if [ "$AWG_PROFILE" = "2.0" ] && config_has_any Interface \
        HeaderProtectionKey ContentPaddingAddition RekeyAfterTime RekeyTimeout \
        RejectAfterTime KeepaliveTimeout MaxHandshakeAttempts RandomTrailers DisableCookies; then
        die "The configuration contains AWG 3.x settings but profile 2.0 was selected."
    fi

    if [ "$AWG_PROFILE" = "2.0" ] && {
        config_has_range Interface H1 H2 H3 H4 ||
            config_has_range Peer PersistentKeepalive;
    }; then
        die "H1-H4 and PersistentKeepalive ranges require profile 3.0 or newer."
    fi

    if [ "$AWG_PROFILE" = "3.0" ] && config_has_any Interface RandomTrailers DisableCookies; then
        die "The configuration contains AWG 3.1 settings but profile 3.0 was selected."
    fi
}

load_config_settings() {
    validate_config_profile

    AWG_PEER_COUNT=$(awk '
        /^[[:space:]]*\[[Pp][Ee][Ee][Rr]\][[:space:]]*$/ { count++ }
        END { print count + 0 }
    ' "$CONFIG_FILE")
    [ "$AWG_PEER_COUNT" -eq 1 ] ||
        die "The installer accepts exactly one [Peer] section; found $AWG_PEER_COUNT. Use LuCI for multi-peer configurations."

    AWG_PRIVATE_KEY_INT=$(config_get_value Interface PrivateKey)
    AWG_IP=$(config_get_value Interface Address)
    AWG_LISTEN_PORT=$(config_get_value Interface ListenPort)
    AWG_MTU=$(config_get_value Interface MTU)
    AWG_DNS=$(config_get_value Interface DNS)

    AWG_JC=$(config_get_value Interface Jc)
    AWG_JMIN=$(config_get_value Interface Jmin)
    AWG_JMAX=$(config_get_value Interface Jmax)
    AWG_S1=$(config_get_value Interface S1)
    AWG_S2=$(config_get_value Interface S2)
    AWG_S3=$(config_get_value Interface S3)
    AWG_S4=$(config_get_value Interface S4)
    AWG_H1=$(config_get_value Interface H1)
    AWG_H2=$(config_get_value Interface H2)
    AWG_H3=$(config_get_value Interface H3)
    AWG_H4=$(config_get_value Interface H4)
    AWG_I1=$(config_get_value Interface I1)
    AWG_I2=$(config_get_value Interface I2)
    AWG_I3=$(config_get_value Interface I3)
    AWG_I4=$(config_get_value Interface I4)
    AWG_I5=$(config_get_value Interface I5)

    AWG_HEADER_PROTECTION_KEY=$(config_get_value Interface HeaderProtectionKey)
    AWG_CONTENT_PADDING_ADDITION=$(config_get_value Interface ContentPaddingAddition)
    AWG_REKEY_AFTER_TIME=$(config_get_value Interface RekeyAfterTime)
    AWG_REKEY_TIMEOUT=$(config_get_value Interface RekeyTimeout)
    AWG_REJECT_AFTER_TIME=$(config_get_value Interface RejectAfterTime)
    AWG_KEEPALIVE_TIMEOUT=$(config_get_value Interface KeepaliveTimeout)
    AWG_MAX_HANDSHAKE_ATTEMPTS=$(config_get_value Interface MaxHandshakeAttempts)
    AWG_RANDOM_TRAILERS=$(config_get_value Interface RandomTrailers)
    AWG_DISABLE_COOKIES=$(config_get_value Interface DisableCookies)

    AWG_PUBLIC_KEY_INT=$(config_get_value Peer PublicKey)
    AWG_PRESHARED_KEY_INT=$(config_get_value Peer PresharedKey)
    AWG_ALLOWED_IPS=$(config_get_value Peer AllowedIPs)
    AWG_PERSISTENT_KEEPALIVE=$(config_get_value Peer PersistentKeepalive)
    AWG_ENDPOINT=$(config_get_value Peer Endpoint)

    [ -n "$AWG_PRIVATE_KEY_INT" ] || die "PrivateKey is missing in $CONFIG_FILE"
    [ -n "$AWG_IP" ] || die "Address is missing in $CONFIG_FILE"
    [ -n "$AWG_PUBLIC_KEY_INT" ] || die "Peer PublicKey is missing in $CONFIG_FILE"
    [ -n "$AWG_ENDPOINT" ] || die "Peer Endpoint is missing in $CONFIG_FILE"

    [ -n "$AWG_LISTEN_PORT" ] || AWG_LISTEN_PORT="51821"
    [ -n "$AWG_ALLOWED_IPS" ] || AWG_ALLOWED_IPS="0.0.0.0/0, ::/0"
    [ -n "$AWG_PERSISTENT_KEEPALIVE" ] || AWG_PERSISTENT_KEEPALIVE="25"

    case "$AWG_ENDPOINT" in
        \[*\]:*)
            AWG_ENDPOINT_INT=${AWG_ENDPOINT#\[}
            AWG_ENDPOINT_INT=${AWG_ENDPOINT_INT%%\]*}
            AWG_ENDPOINT_PORT_INT=${AWG_ENDPOINT##*\]:}
            ;;
        *:*)
            AWG_ENDPOINT_INT=${AWG_ENDPOINT%:*}
            AWG_ENDPOINT_PORT_INT=${AWG_ENDPOINT##*:}
            ;;
        *) die "Endpoint must include a port: $AWG_ENDPOINT" ;;
    esac

    if [ -n "$AWG_RANDOM_TRAILERS" ]; then
        AWG_RANDOM_TRAILERS=$(normalize_on_off "$AWG_RANDOM_TRAILERS") ||
            die "RandomTrailers must be on/off or 0/1."
    fi
    if [ -n "$AWG_DISABLE_COOKIES" ]; then
        AWG_DISABLE_COOKIES=$(normalize_on_off "$AWG_DISABLE_COOKIES") ||
            die "DisableCookies must be on/off or 0/1."
    fi

    validate_connection_settings
}

collect_interface_settings() {
    AWG_LISTEN_PORT="51821"
    AWG_ALLOWED_IPS="0.0.0.0/0, ::/0"
    AWG_MTU=""
    AWG_DNS=""

    read_prompt "Enter the private key (from [Interface]):"
    AWG_PRIVATE_KEY_INT=$READ_VALUE

    while :; do
        read_prompt "Enter internal IP address with subnet, example 192.168.100.5/24 (from [Interface]):"
        AWG_IP=$READ_VALUE
        if printf '%s\n' "$AWG_IP" | grep -Eq '^([0-9]{1,3}\.){3}[0-9]{1,3}/[0-9]+$'; then
            break
        fi
        printf 'This IP is not valid. Please repeat\n'
    done

    read_prompt "Enter the public key (from [Peer]):"
    AWG_PUBLIC_KEY_INT=$READ_VALUE
    read_prompt "If use PresharedKey, enter it (from [Peer]). If you do not use it, leave blank:"
    AWG_PRESHARED_KEY_INT=$READ_VALUE
    read_prompt "Enter Endpoint host without port (Domain or IP) (from [Peer]):"
    AWG_ENDPOINT_INT=$READ_VALUE
    read_prompt "Enter Endpoint host port (from [Peer]) [51820]:" "51820"
    AWG_ENDPOINT_PORT_INT=$READ_VALUE

    read_prompt "Enter Jc value (from [Interface]):"
    AWG_JC=$READ_VALUE
    read_prompt "Enter Jmin value (from [Interface]):"
    AWG_JMIN=$READ_VALUE
    read_prompt "Enter Jmax value (from [Interface]):"
    AWG_JMAX=$READ_VALUE
    read_prompt "Enter S1 value (from [Interface]):"
    AWG_S1=$READ_VALUE
    read_prompt "Enter S2 value (from [Interface]):"
    AWG_S2=$READ_VALUE
    read_prompt "Enter H1 value (from [Interface]):"
    AWG_H1=$READ_VALUE
    read_prompt "Enter H2 value (from [Interface]):"
    AWG_H2=$READ_VALUE
    read_prompt "Enter H3 value (from [Interface]):"
    AWG_H3=$READ_VALUE
    read_prompt "Enter H4 value (from [Interface]):"
    AWG_H4=$READ_VALUE

    if [ "$AWG_PROFILE" != "1.0" ]; then
        read_prompt "Enter S3 value (from [Interface]) [optional, leave blank to skip]:"
        AWG_S3=$READ_VALUE
        read_prompt "Enter S4 value (from [Interface]) [optional, leave blank to skip]:"
        AWG_S4=$READ_VALUE
        read_prompt "Enter I1 value (from [Interface]) [optional, leave blank to skip]:"
        AWG_I1=$READ_VALUE
        read_prompt "Enter I2 value (from [Interface]) [optional, leave blank to skip]:"
        AWG_I2=$READ_VALUE
        read_prompt "Enter I3 value (from [Interface]) [optional, leave blank to skip]:"
        AWG_I3=$READ_VALUE
        read_prompt "Enter I4 value (from [Interface]) [optional, leave blank to skip]:"
        AWG_I4=$READ_VALUE
        read_prompt "Enter I5 value (from [Interface]) [optional, leave blank to skip]:"
        AWG_I5=$READ_VALUE
    fi

    AWG_PERSISTENT_KEEPALIVE="25"
    if is_awg3; then
        read_prompt "Enter HeaderProtectionKey (from [Interface]) [optional, leave blank to skip]:"
        AWG_HEADER_PROTECTION_KEY=$READ_VALUE
        read_prompt "Enter ContentPaddingAddition (number or range) [optional, leave blank to skip]:"
        AWG_CONTENT_PADDING_ADDITION=$READ_VALUE
        read_prompt "Enter RekeyAfterTime (number or range) [optional, leave blank to use default]:"
        AWG_REKEY_AFTER_TIME=$READ_VALUE
        read_prompt "Enter RekeyTimeout (number or range) [optional, leave blank to use default]:"
        AWG_REKEY_TIMEOUT=$READ_VALUE
        read_prompt "Enter RejectAfterTime (number or range) [optional, leave blank to use default]:"
        AWG_REJECT_AFTER_TIME=$READ_VALUE
        read_prompt "Enter KeepaliveTimeout (number or range) [optional, leave blank to use default]:"
        AWG_KEEPALIVE_TIMEOUT=$READ_VALUE
        read_prompt "Enter MaxHandshakeAttempts (number or range) [optional, leave blank to use default]:"
        AWG_MAX_HANDSHAKE_ATTEMPTS=$READ_VALUE
        read_prompt "Enter PersistentKeepalive (number or range) [25]:" "25"
        AWG_PERSISTENT_KEEPALIVE=$READ_VALUE
    fi

    if [ "$AWG_PROFILE" = "3.1" ]; then
        read_on_off_prompt "Enter RandomTrailers (on/off) [off]:" "off"
        AWG_RANDOM_TRAILERS=$READ_VALUE
        read_on_off_prompt "Enter DisableCookies (on/off) [off]:" "off"
        AWG_DISABLE_COOKIES=$READ_VALUE
    fi

    validate_connection_settings
}

uci_set() {
    uci set "$1=$2"
}

uci_set_if_present() {
    if [ -n "$2" ]; then
        uci_set "$1" "$2"
    fi
}

uci_delete() {
    uci -q delete "$1" >/dev/null 2>&1 || true
}

uci_add_list_values() {
    UCI_LIST_KEY=$1
    UCI_LIST_VALUES=$2
    UCI_LIST_OLD_IFS=$IFS
    IFS=','
    set -- $UCI_LIST_VALUES
    IFS=$UCI_LIST_OLD_IFS

    for UCI_LIST_VALUE in "$@"; do
        UCI_LIST_VALUE=$(printf '%s\n' "$UCI_LIST_VALUE" |
            sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        [ -n "$UCI_LIST_VALUE" ] || continue
        uci add_list "${UCI_LIST_KEY}=${UCI_LIST_VALUE}"
    done
}

write_network_config() {
    uci_set "network.${INTERFACE_NAME}" "interface"
    uci_set "network.${INTERFACE_NAME}.proto" "$PROTO"
    uci_set "network.${INTERFACE_NAME}.private_key" "$AWG_PRIVATE_KEY_INT"
    uci_set "network.${INTERFACE_NAME}.listen_port" "$AWG_LISTEN_PORT"
    uci_delete "network.${INTERFACE_NAME}.addresses"
    uci_add_list_values "network.${INTERFACE_NAME}.addresses" "$AWG_IP"
    uci_delete "network.${INTERFACE_NAME}.dns"
    uci_add_list_values "network.${INTERFACE_NAME}.dns" "$AWG_DNS"
    if [ -n "$AWG_MTU" ]; then
        uci_set "network.${INTERFACE_NAME}.mtu" "$AWG_MTU"
    else
        uci_delete "network.${INTERFACE_NAME}.mtu"
    fi

    for AWG_OPTION in \
        awg_s3 awg_s4 awg_i1 awg_i2 awg_i3 awg_i4 awg_i5 \
        awg_header_protection_key awg_content_padding_addition \
        awg_rekey_after_time awg_rekey_timeout awg_reject_after_time \
        awg_keepalive_timeout awg_max_handshake_attempts \
        awg_random_trailers awg_disable_cookies; do
        uci_delete "network.${INTERFACE_NAME}.${AWG_OPTION}"
    done

    uci_set "network.${INTERFACE_NAME}.awg_jc" "$AWG_JC"
    uci_set "network.${INTERFACE_NAME}.awg_jmin" "$AWG_JMIN"
    uci_set "network.${INTERFACE_NAME}.awg_jmax" "$AWG_JMAX"
    uci_set "network.${INTERFACE_NAME}.awg_s1" "$AWG_S1"
    uci_set "network.${INTERFACE_NAME}.awg_s2" "$AWG_S2"
    uci_set "network.${INTERFACE_NAME}.awg_h1" "$AWG_H1"
    uci_set "network.${INTERFACE_NAME}.awg_h2" "$AWG_H2"
    uci_set "network.${INTERFACE_NAME}.awg_h3" "$AWG_H3"
    uci_set "network.${INTERFACE_NAME}.awg_h4" "$AWG_H4"

    if [ "$AWG_PROFILE" != "1.0" ]; then
        uci_set_if_present "network.${INTERFACE_NAME}.awg_s3" "$AWG_S3"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_s4" "$AWG_S4"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_i1" "$AWG_I1"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_i2" "$AWG_I2"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_i3" "$AWG_I3"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_i4" "$AWG_I4"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_i5" "$AWG_I5"
    fi

    if is_awg3; then
        uci_set_if_present "network.${INTERFACE_NAME}.awg_header_protection_key" "$AWG_HEADER_PROTECTION_KEY"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_content_padding_addition" "$AWG_CONTENT_PADDING_ADDITION"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_rekey_after_time" "$AWG_REKEY_AFTER_TIME"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_rekey_timeout" "$AWG_REKEY_TIMEOUT"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_reject_after_time" "$AWG_REJECT_AFTER_TIME"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_keepalive_timeout" "$AWG_KEEPALIVE_TIMEOUT"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_max_handshake_attempts" "$AWG_MAX_HANDSHAKE_ATTEMPTS"
    fi

    if [ "$AWG_PROFILE" = "3.1" ]; then
        uci_set_if_present "network.${INTERFACE_NAME}.awg_random_trailers" "$AWG_RANDOM_TRAILERS"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_disable_cookies" "$AWG_DISABLE_COOKIES"
    fi

    if ! uci -q get "network.@${CONFIG_NAME}[0]" >/dev/null 2>&1; then
        uci add network "$CONFIG_NAME" >/dev/null
    fi

    PEER_SECTION="network.@${CONFIG_NAME}[0]"
    uci_set "$PEER_SECTION" "$CONFIG_NAME"
    uci_set "${PEER_SECTION}.name" "${INTERFACE_NAME}_client"
    uci_set "${PEER_SECTION}.public_key" "$AWG_PUBLIC_KEY_INT"
    if [ -n "$AWG_PRESHARED_KEY_INT" ]; then
        uci_set "${PEER_SECTION}.preshared_key" "$AWG_PRESHARED_KEY_INT"
    else
        uci_delete "${PEER_SECTION}.preshared_key"
    fi
    uci_set "${PEER_SECTION}.route_allowed_ips" "1"
    uci_set "${PEER_SECTION}.persistent_keepalive" "$AWG_PERSISTENT_KEEPALIVE"
    uci_set "${PEER_SECTION}.endpoint_host" "$AWG_ENDPOINT_INT"
    uci_delete "${PEER_SECTION}.allowed_ips"
    uci_add_list_values "${PEER_SECTION}.allowed_ips" "$AWG_ALLOWED_IPS"
    uci_set "${PEER_SECTION}.endpoint_port" "$AWG_ENDPOINT_PORT_INT"
    uci commit network
}

find_firewall_section() {
    FIREWALL_SECTION_TYPE=$1
    FIREWALL_SECTION_NAME=$2

    uci -q show firewall 2>/dev/null |
        sed -n "s/^\(firewall\.@${FIREWALL_SECTION_TYPE}\[[0-9][0-9]*\]\)\.name='${FIREWALL_SECTION_NAME}'$/\1/p" |
        head -n 1
}

ensure_firewall_zone() {
    FIREWALL_ZONE_SECTION=$(find_firewall_section "zone" "$ZONE_NAME")
    if [ -z "$FIREWALL_ZONE_SECTION" ]; then
        print_info "Zone Create"
        uci add firewall zone >/dev/null
        FIREWALL_ZONE_SECTION="firewall.@zone[-1]"
    fi

    uci_set "${FIREWALL_ZONE_SECTION}.name" "$ZONE_NAME"
    uci_set "${FIREWALL_ZONE_SECTION}.network" "$INTERFACE_NAME"
    uci_set "${FIREWALL_ZONE_SECTION}.forward" "REJECT"
    uci_set "${FIREWALL_ZONE_SECTION}.output" "ACCEPT"
    uci_set "${FIREWALL_ZONE_SECTION}.input" "REJECT"
    uci_set "${FIREWALL_ZONE_SECTION}.masq" "1"
    uci_set "${FIREWALL_ZONE_SECTION}.masq6" "1"
    uci_set "${FIREWALL_ZONE_SECTION}.mtu_fix" "1"
    uci_delete "${FIREWALL_ZONE_SECTION}.family"
}

ensure_firewall_forwarding() {
    FORWARDING_NAME="${ZONE_NAME}-lan"
    FIREWALL_FORWARDING_SECTION=$(find_firewall_section "forwarding" "$FORWARDING_NAME")
    if [ -z "$FIREWALL_FORWARDING_SECTION" ]; then
        print_info "Configured forwarding"
        uci add firewall forwarding >/dev/null
        FIREWALL_FORWARDING_SECTION="firewall.@forwarding[-1]"
    fi

    uci_set "$FIREWALL_FORWARDING_SECTION" "forwarding"
    uci_set "${FIREWALL_FORWARDING_SECTION}.name" "$FORWARDING_NAME"
    uci_set "${FIREWALL_FORWARDING_SECTION}.dest" "$ZONE_NAME"
    uci_set "${FIREWALL_FORWARDING_SECTION}.src" "lan"
    uci_delete "${FIREWALL_FORWARDING_SECTION}.family"
}

configure_amneziawg_interface() {
    CONFIG_NAME="amneziawg_${INTERFACE_NAME}"
    PROTO="amneziawg"
    ZONE_NAME="$INTERFACE_NAME"

    select_awg_profile
    if [ -n "$CONFIG_FILE" ]; then
        load_config_settings
    else
        collect_interface_settings
    fi
    write_network_config
    ensure_firewall_zone
    ensure_firewall_forwarding
    uci commit firewall

    service network restart
}

main() {
    parse_options "$@"
    detect_package_manager
    prepare_awg_packages
    verify_luci_parser

    if [ "$ASK_FOR_INTERFACE_CONFIG" -eq 1 ]; then
        if [ -n "$CONFIG_FILE" ]; then
            configure_amneziawg_interface
        elif ask_yes_no "Do you want to configure the amneziawg interface? (y/N):" "n"; then
            configure_amneziawg_interface
        else
            print_info "Skipping amneziawg interface configuration."
        fi
    fi

    print_post_install_instructions
}

trap cleanup_downloads 0
trap 'exit 1' HUP INT TERM

if [ "${AMNEZIAWG_INSTALL_SOURCE_ONLY:-0}" != "1" ]; then
    main "$@"
fi
