#!/bin/sh

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
AMNEZIAWG_INSTALL_SOURCE_ONLY=1
export AMNEZIAWG_INSTALL_SOURCE_ONLY
. "$SCRIPT_DIR/amneziawg-install.sh"

FAILED=0

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

assert_contains() {
    PATTERN=$1
    FILE=$2
    TEST_NAME=$3

    if ! grep -F -q -e "$PATTERN" "$FILE"; then
        printf 'not ok - %s: missing pattern "%s" in %s\n' \
            "$TEST_NAME" "$PATTERN" "$FILE" >&2
        FAILED=1
        return
    fi
    printf 'ok - %s\n' "$TEST_NAME"
}

RELEASE=$(printf '%s\n' \
    '[   12.615062] amneziawg: AmneziaWG 3.0.20260731 loaded. See amnezia.org for information.' \
    '[31667.970341] amneziawg: AmneziaWG 3.1.20260812 loaded. See amnezia.org for information.' |
    extract_last_awg_release_from_log)
assert_equal "3.1.20260812" "$RELEASE" "last loaded module wins"

RELEASE=$(printf '%s\n' \
    '[   12.615062] amneziawg: AmneziaWG 3.0.20260731 loaded. See amnezia.org for information.' |
    extract_last_awg_release_from_log)
assert_equal "3.0.20260731" "$RELEASE" "single load message"

PROFILE=$(awg_profile_from_release "3.1.20260812")
assert_equal "3.1" "$PROFILE" "AWG 3.1 release classification"

PROFILE=$(awg_profile_from_release "3.0.20260731")
assert_equal "3.0" "$PROFILE" "AWG 3.0 release classification"

PROFILE=$(awg_profile_from_release "2.0.0")
assert_equal "2.0" "$PROFILE" "AWG 2 release classification"

PROFILE=$(awg_profile_from_release "" 2>/dev/null || true)
assert_equal "" "$PROFILE" "empty release is not AWG 2"

PROFILE=$(awg_profile_from_release "unexpected" 2>/dev/null || true)
assert_equal "" "$PROFILE" "unknown release is not AWG 2"

TEST_DIR=$(mktemp -d "${TMPDIR:-/tmp}/amneziawg-install-test.XXXXXX") || exit 1
trap 'rm -rf "$TEST_DIR"' EXIT HUP INT TERM
mkdir -p "$TEST_DIR/apk-repositories.d" "$TEST_DIR/opkg"
APK_REPOSITORIES_FILE="$TEST_DIR/apk-repositories"
APK_REPOSITORIES_DIR="$TEST_DIR/apk-repositories.d"
OPKG_FEED_CONFIG="$TEST_DIR/opkg/customfeeds.conf"

SKIP_PACKAGE_INSTALL=0
parse_options -s -e -n
assert_equal "1" "$SKIP_PACKAGE_INSTALL" "-s skips package installation"

usage > "$TEST_DIR/usage"
assert_contains \
    "-s    skip package installation and use the installed AmneziaWG packages" \
    "$TEST_DIR/usage" \
    "usage documents package installation skip mode"

assert_not_contains 'wget -q' "$SCRIPT_DIR/amneziawg-install.sh" \
    "manual installer shows wget errors"

ubus() {
    printf '%s\n' '{"release":{"version":"25.12.2"}}'
}
jsonfilter() {
    cat >/dev/null
    printf '%s\n' '25.12.2'
}
is_pkg_installed() {
    case "$1" in
        kmod-amneziawg | amneziawg-tools | luci-proto-amneziawg) return 0 ;;
        *) return 1 ;;
    esac
}
awg() {
    printf '%s\n' 'amneziawg-tools v3.1.20260812'
}

use_installed_awg_packages > "$TEST_DIR/use-installed-output"
assert_equal "3.1" "$AWG_VERSION" "skip mode detects installed AWG stack"
assert_equal "luci-proto-amneziawg" "$LUCI_PACKAGE_NAME" \
    "skip mode requires the LuCI package for the OpenWrt release"
assert_contains \
    "Skipping package installation; using the installed AWG 3.1 stack." \
    "$TEST_DIR/use-installed-output" \
    "skip mode reports the installed stack"

printf '%s\n' \
    'https://slava-shchipunov.github.io/awg-openwrt/25.12.5/mediatek/filogic/packages.adb' \
    > "$APK_REPOSITORIES_DIR/customfeeds.list"
remove_legacy_feeds >/dev/null
assert_not_contains "$LEGACY_FEED_PATTERN" "$APK_REPOSITORIES_DIR/customfeeds.list" \
    "manual installer removes legacy feed"

REMOVED_PACKAGE=""
is_pkg_installed() {
    [ "$1" = "luci-proto-amneziawg" ]
}
remove_pkg() {
    REMOVED_PACKAGE=$1
}
remove_conflicting_luci_package "luci-app-amneziawg" >/dev/null
assert_equal "luci-proto-amneziawg" "$REMOVED_PACKAGE" \
    "manual installer removes conflicting LuCI variant"

USED_INSTALLED_PACKAGES=0
TOUCHED_PACKAGE_REPOSITORIES=0
use_installed_awg_packages() {
    USED_INSTALLED_PACKAGES=1
}
remove_legacy_feeds() {
    TOUCHED_PACKAGE_REPOSITORIES=1
}
check_repo() {
    TOUCHED_PACKAGE_REPOSITORIES=1
}
install_awg_packages() {
    TOUCHED_PACKAGE_REPOSITORIES=1
}

SKIP_PACKAGE_INSTALL=1
prepare_awg_packages
assert_equal "1" "$USED_INSTALLED_PACKAGES" \
    "skip mode uses the installed package set"
assert_equal "0" "$TOUCHED_PACKAGE_REPOSITORIES" \
    "skip mode bypasses package repositories and downloads"

exit "$FAILED"
