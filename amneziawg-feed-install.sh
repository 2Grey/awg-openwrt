#!/bin/sh

# Install AmneziaWG from the signed awg-openwrt package feed.
# Keep this script compatible with BusyBox ash used by OpenWrt.

FEED_ROOT="https://2grey.github.io/awg-openwrt"
INSTALL_TRANSLATION=0
TEMP_KEY=""

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

trap cleanup EXIT
trap 'exit 1' HUP INT TERM

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

[ "$(id -u)" -eq 0 ] || die "Run this script as root."
command -v wget >/dev/null 2>&1 || die "wget is required."

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

if command -v apk >/dev/null 2>&1; then
    PACKAGE_MANAGER="apk"
elif command -v opkg >/dev/null 2>&1; then
    PACKAGE_MANAGER="opkg"
else
    die "No supported package manager found (apk or opkg)."
fi

if [ "$PACKAGE_MANAGER" = "opkg" ]; then
    command -v opkg-key >/dev/null 2>&1 || die "opkg-key is required to add the feed signing key."

    TEMP_KEY="/tmp/awg-openwrt-feed.$$.pub"
    info "Downloading and installing the feed signing key..."
    wget -q -O "$TEMP_KEY" "$FEED_ROOT/keys/awg-openwrt-feed.pub" ||
        die "Unable to download the feed signing key."
    [ -s "$TEMP_KEY" ] || die "The downloaded feed signing key is empty."
    opkg-key add "$TEMP_KEY" >/dev/null || die "Unable to install the feed signing key."

    FEED_CONFIG="/etc/opkg/customfeeds.conf"
    mkdir -p /etc/opkg || die "Unable to create /etc/opkg."
    [ -f "$FEED_CONFIG" ] || : > "$FEED_CONFIG"
    sed -i '\|^[[:space:]]*src/gz[[:space:]][[:space:]]*awg[[:space:]]|d' "$FEED_CONFIG" ||
        die "Unable to update $FEED_CONFIG."
    printf 'src/gz awg %s\n' "$FEED_URL" >> "$FEED_CONFIG" ||
        die "Unable to write $FEED_CONFIG."

    info "Updating package indexes..."
    opkg update || die "Unable to update package indexes. Check that a feed exists for this exact OpenWrt build."

    info "Installing AmneziaWG packages..."
    if [ "$INSTALL_TRANSLATION" -eq 1 ]; then
        opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg luci-i18n-amneziawg-ru ||
            die "Unable to install AmneziaWG packages."
    else
        opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg ||
            die "Unable to install AmneziaWG packages."
    fi
else
    KEY_DIR="/etc/apk/keys"
    REPOSITORY_DIR="/etc/apk/repositories.d"
    REPOSITORY_CONFIG="$REPOSITORY_DIR/customfeeds.list"
    TEMP_KEY="/tmp/awg-openwrt-feed.$$.pem"

    mkdir -p "$KEY_DIR" "$REPOSITORY_DIR" || die "Unable to create APK configuration directories."
    info "Downloading and installing the feed signing key..."
    wget -q -O "$TEMP_KEY" "$FEED_ROOT/keys/awg-openwrt-feed.pem" ||
        die "Unable to download the feed signing key."
    [ -s "$TEMP_KEY" ] || die "The downloaded feed signing key is empty."
    mv "$TEMP_KEY" "$KEY_DIR/awg-openwrt-feed.pem" || die "Unable to install the feed signing key."
    TEMP_KEY=""

    [ -f "$REPOSITORY_CONFIG" ] || : > "$REPOSITORY_CONFIG"
    sed -i '\|^[[:space:]]*https://2grey\.github\.io/awg-openwrt/.*packages\.adb[[:space:]]*$|d' "$REPOSITORY_CONFIG" ||
        die "Unable to update $REPOSITORY_CONFIG."
    printf '%s/packages.adb\n' "$FEED_URL" >> "$REPOSITORY_CONFIG" ||
        die "Unable to write $REPOSITORY_CONFIG."

    info "Updating package indexes..."
    apk update || die "Unable to update package indexes. Check that a feed exists for this exact OpenWrt build."

    info "Installing AmneziaWG packages..."
    if [ "$INSTALL_TRANSLATION" -eq 1 ]; then
        apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg luci-i18n-amneziawg-ru ||
            die "Unable to install AmneziaWG packages."
    else
        apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg ||
            die "Unable to install AmneziaWG packages."
    fi
fi

info "AmneziaWG packages installed successfully."
info "The feed remains configured and will be used for package updates."
