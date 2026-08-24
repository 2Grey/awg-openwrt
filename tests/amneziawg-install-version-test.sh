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

exit "$FAILED"
