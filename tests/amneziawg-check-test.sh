#!/bin/sh

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
AMNEZIAWG_CHECK_SOURCE_ONLY=1
export AMNEZIAWG_CHECK_SOURCE_ONLY
. "$SCRIPT_DIR/amneziawg-check.sh"

FAILED=0
TEST_DIR=$(mktemp -d "${TMPDIR:-/tmp}/amneziawg-check-test.XXXXXX") || exit 1
trap 'rm -rf "$TEST_DIR"' EXIT HUP INT TERM

assert_contains() {
    PATTERN=$1
    TEXT=$2
    TEST_NAME=$3

    if ! printf '%s\n' "$TEXT" | grep -q "$PATTERN"; then
        printf 'not ok - %s: missing pattern "%s"\n' "$TEST_NAME" "$PATTERN" >&2
        FAILED=1
        return
    fi
    printf 'ok - %s\n' "$TEST_NAME"
}

mkdir -p "$TEST_DIR/apk-repositories.d" "$TEST_DIR/opkg"
APK_REPOSITORIES_FILE="$TEST_DIR/apk-repositories"
APK_REPOSITORIES_DIR="$TEST_DIR/apk-repositories.d"
OPKG_CONFIG_DIR="$TEST_DIR/opkg"
APK_WORLD_FILE="$TEST_DIR/world"
LUCI_PROTOCOL_FILE="$TEST_DIR/amneziawg.js"

printf '%s\n' \
    'https://slava-shchipunov.github.io/awg-openwrt/25.12.5/mediatek/filogic/packages.adb' \
    > "$APK_REPOSITORIES_DIR/customfeeds.list"
printf '%s\n' \
    'amneziawg-tools><identity-hash' \
    'kmod-amneziawg' \
    'unrelated-package' \
    > "$APK_WORLD_FILE"
printf '%s\n' \
    "if (!stubValidator.apply('port', pconf.peer_persistentkeepalive || '0'))" \
    > "$LUCI_PROTOCOL_FILE"

LEGACY_OUTPUT=$(print_legacy_feeds)
assert_contains "$LEGACY_FEED_PATTERN" "$LEGACY_OUTPUT" "legacy feed is reported"

PACKAGE_MANAGER="apk"
WORLD_OUTPUT=$(print_apk_world_constraints)
assert_contains 'amneziawg-tools><identity-hash' "$WORLD_OUTPUT" "APK identity pin is reported"
assert_contains 'kmod-amneziawg' "$WORLD_OUTPUT" "unversioned AWG world entry is reported"

PARSER_OUTPUT=$(print_luci_parser)
assert_contains 'legacy parser detected' "$PARSER_OUTPUT" "legacy LuCI parser is identified"

printf '%s\n' \
    'if (validateUint16Range(null, pconf.peer_persistentkeepalive || "0") !== true)' \
    > "$LUCI_PROTOCOL_FILE"
PARSER_OUTPUT=$(print_luci_parser)
assert_contains 'range support: present' "$PARSER_OUTPUT" "current LuCI parser is identified"

exit "$FAILED"
