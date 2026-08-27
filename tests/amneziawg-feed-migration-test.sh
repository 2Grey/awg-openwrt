#!/bin/sh

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
AMNEZIAWG_FEED_INSTALL_SOURCE_ONLY=1
export AMNEZIAWG_FEED_INSTALL_SOURCE_ONLY
. "$SCRIPT_DIR/amneziawg-feed-install.sh"

FAILED=0
TEST_DIR=$(mktemp -d "${TMPDIR:-/tmp}/amneziawg-feed-test.XXXXXX") || exit 1
trap 'rm -rf "$TEST_DIR"' EXIT HUP INT TERM

assert_equal() {
    EXPECTED=$1
    ACTUAL=$2
    TEST_NAME=$3

    if [ "$EXPECTED" != "$ACTUAL" ]; then
        printf 'not ok - %s: expected "%s", got "%s"\n' \
            "$TEST_NAME" "$EXPECTED" "$ACTUAL" >&2
        FAILED=1
        return
    fi
    printf 'ok - %s\n' "$TEST_NAME"
}

assert_not_contains() {
    PATTERN=$1
    FILE=$2
    TEST_NAME=$3

    if grep -q "$PATTERN" "$FILE"; then
        printf 'not ok - %s: unexpected pattern "%s" in %s\n' \
            "$TEST_NAME" "$PATTERN" "$FILE" >&2
        FAILED=1
        return
    fi
    printf 'ok - %s\n' "$TEST_NAME"
}

mkdir -p "$TEST_DIR/apk-repositories.d" "$TEST_DIR/opkg"
APK_REPOSITORIES_FILE="$TEST_DIR/apk-repositories"
APK_REPOSITORIES_DIR="$TEST_DIR/apk-repositories.d"
OPKG_FEED_CONFIG="$TEST_DIR/opkg/customfeeds.conf"

printf '%s\n' \
    'https://downloads.openwrt.org/releases/packages.adb' \
    'https://slava-shchipunov.github.io/awg-openwrt/25.12.5/mediatek/filogic/packages.adb' \
    > "$APK_REPOSITORIES_FILE"
printf '%s\n' \
    'https://slava-shchipunov.github.io/awg-openwrt/25.12.5/x86/64/packages.adb' \
    'https://example.invalid/other/packages.adb' \
    > "$APK_REPOSITORIES_DIR/customfeeds.list"
printf '%s\n' \
    'src/gz legacy https://slava-shchipunov.github.io/awg-openwrt/24.10.8/x86/64' \
    'src/gz other https://example.invalid/packages' \
    > "$OPKG_FEED_CONFIG"

remove_legacy_feeds >/dev/null
assert_not_contains "$LEGACY_FEED_PATTERN" "$APK_REPOSITORIES_FILE" \
    "legacy feed removed from main APK repositories"
assert_not_contains "$LEGACY_FEED_PATTERN" "$APK_REPOSITORIES_DIR/customfeeds.list" \
    "legacy feed removed from APK custom feed"
assert_not_contains "$LEGACY_FEED_PATTERN" "$OPKG_FEED_CONFIG" \
    "legacy feed removed from opkg custom feed"

PACKAGE_MANAGER="apk"
REMOVED_PACKAGE=""
is_package_installed() {
    [ "$1" = "luci-app-amneziawg" ]
}
remove_package() {
    REMOVED_PACKAGE=$1
}
remove_conflicting_luci_package "luci-proto-amneziawg" >/dev/null
assert_equal "luci-app-amneziawg" "$REMOVED_PACKAGE" \
    "legacy LuCI package removed before luci-proto installation"

APK_COMMAND=""
is_package_installed() {
    case "$1" in
        amneziawg-tools | kmod-amneziawg | luci-proto-amneziawg) return 0 ;;
        *) return 1 ;;
    esac
}
apk() {
    APK_COMMAND=$*
}
upgrade_installed_apk_packages >/dev/null
assert_equal \
    "upgrade --available amneziawg-tools kmod-amneziawg luci-proto-amneziawg" \
    "$APK_COMMAND" \
    "APK migration resets local-file identity pins"

LUCI_PROTOCOL_FILE="$TEST_DIR/amneziawg.js"
printf '%s\n' \
    'if (validateUint16Range(null, pconf.peer_persistentkeepalive || "0") !== true)' \
    > "$LUCI_PROTOCOL_FILE"
verify_luci_parser >/dev/null
assert_equal "0" "$?" "AWG 3.x LuCI parser marker accepted"

exit "$FAILED"
