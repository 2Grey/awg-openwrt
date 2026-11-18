#!/bin/sh

SCRIPT_DIR=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
AMNEZIAWG_INSTALL_SOURCE_ONLY=1
export AMNEZIAWG_INSTALL_SOURCE_ONLY
. "$SCRIPT_DIR/amneziawg-install.sh"

TEST_DIR=$(mktemp -d "${TMPDIR:-/tmp}/amneziawg-download-test.XXXXXX") || exit 1
trap 'rm -rf "$TEST_DIR"' 0
FAILED=0
BASE_URL='https://github.com/owner/repo/releases/download/v1/'
FILE='package_v1.apk'
URL="$BASE_URL$FILE"

assert_equal() {
    if [ "$1" = "$2" ]; then
        printf 'ok - %s\n' "$3"
    else
        printf 'not ok - %s: expected "%s", got "%s"\n' "$3" "$1" "$2" >&2
        FAILED=1
    fi
}

# Model failed downloads leaving partial files, successful empty responses,
# and wget implementations that write progress to stdout.
wget() {
    [ "$1" = '-T' ] && [ "$2" = '20' ] || return 2
    shift 2
    [ "$1" = '-t' ] && [ "$2" = '1' ] || return 2
    shift 2
    [ "$1" = '-O' ] || return 2
    MOCK_PATH=$2
    MOCK_URL=$3
    printf '%s\n' "$MOCK_URL" >> "$TEST_DIR/requests"
    if [ -e "$MOCK_PATH" ]; then
        printf 'stale download found\n' >> "$TEST_DIR/stale"
    fi
    printf 'wget progress\n'
    if [ "$MOCK_URL" = "$SUCCESS_URL" ]; then
        printf 'package data\n' > "$MOCK_PATH"
        return 0
    fi
    if [ "$MOCK_URL" = "${EMPTY_URL:-}" ]; then
        : > "$MOCK_PATH"
        return 0
    fi
    printf 'partial data\n' > "$MOCK_PATH"
    return 1
}

reset_case() {
    rm -f "$TEST_DIR/requests" "$TEST_DIR/stale" "$TEST_DIR/$FILE" "$TEST_DIR/package_v1.ipk"
    AWG_GITHUB_PROXY=''
    EMPTY_URL=''
    SUCCESS_URL=''
    PKG_EXT=apk
}

reset_case
SUCCESS_URL=$URL
OUTPUT=$(download_package package _v1 "$TEST_DIR" "$BASE_URL" 2> "$TEST_DIR/log")
assert_equal "$FILE" "$OUTPUT" 'stdout contains only the filename'
assert_equal "$URL" "$(cat "$TEST_DIR/requests")" 'direct success skips mirrors'

reset_case
AWG_GITHUB_PROXY='https://custom.example/prefix'
SUCCESS_URL="$AWG_GITHUB_PROXY/$URL"
OUTPUT=$(download_package package _v1 "$TEST_DIR" "$BASE_URL" 2> "$TEST_DIR/log")
assert_equal "$FILE" "$OUTPUT" 'custom proxy without trailing slash succeeds'
assert_equal "$SUCCESS_URL" "$(cat "$TEST_DIR/requests")" 'custom proxy is first and skips other routes on success'

reset_case
AWG_GITHUB_PROXY='https://custom.example/prefix/'
SUCCESS_URL=$URL
download_package package _v1 "$TEST_DIR" "$BASE_URL" > /dev/null 2> "$TEST_DIR/log"
assert_equal "${AWG_GITHUB_PROXY}${URL}
$URL" "$(cat "$TEST_DIR/requests")" 'custom proxy failure falls back to direct GitHub'
assert_equal '0' "$(test -e "$TEST_DIR/stale" && echo 1 || echo 0)" 'partial file removed before next route'

reset_case
SUCCESS_URL="https://gh-proxy.org/$URL"
download_package package _v1 "$TEST_DIR" "$BASE_URL" > /dev/null 2> "$TEST_DIR/log"
assert_equal "$URL
https://ghproxy.net/$URL
https://ghfast.top/$URL
https://gh-proxy.com/$URL
https://gh-proxy.org/$URL" "$(cat "$TEST_DIR/requests")" 'all built-in mirrors follow direct GitHub in order'

reset_case
EMPTY_URL=$URL
SUCCESS_URL="https://ghproxy.net/$URL"
OUTPUT=$(download_package package _v1 "$TEST_DIR" "$BASE_URL" 2> "$TEST_DIR/log")
assert_equal "$FILE" "$OUTPUT" 'empty successful response falls back to a mirror'
assert_equal '2' "$(wc -l < "$TEST_DIR/requests" | tr -d ' ')" 'empty response does not stop downloads'

reset_case
SUCCESS_URL="${BASE_URL}package_v1.ipk"
OUTPUT=$(download_package package _v1 "$TEST_DIR" "$BASE_URL" 2> "$TEST_DIR/log")
assert_equal 'package_v1.ipk' "$OUTPUT" 'alternate extension still supported'
assert_equal '6' "$(wc -l < "$TEST_DIR/requests" | tr -d ' ')" 'preferred extension exhausts mirrors before alternate extension'
assert_equal "$SUCCESS_URL" "$(tail -n 1 "$TEST_DIR/requests")" 'alternate extension starts with direct GitHub'

reset_case
PKG_EXT=ipk
SUCCESS_URL="https://ghproxy.net/${BASE_URL}package_v1.ipk"
OUTPUT=$(download_package package _v1 "$TEST_DIR" "$BASE_URL" 2> "$TEST_DIR/log")
assert_equal 'package_v1.ipk' "$OUTPUT" 'opkg downloads also use mirrors'

reset_case
STATUS=0
download_package package _v1 "$TEST_DIR" "$BASE_URL" > "$TEST_DIR/output" 2> "$TEST_DIR/log" || STATUS=$?
assert_equal '1' "$STATUS" 'all failures return an error'
assert_equal '' "$(cat "$TEST_DIR/output")" 'failed downloads do not return a filename'
assert_equal '10' "$(wc -l < "$TEST_DIR/requests" | tr -d ' ')" 'all routes tried for both extensions'
assert_equal '0' "$(test -e "$TEST_DIR/package_v1.ipk" && echo 1 || echo 0)" 'last partial download removed'

reset_case
AWG_GITHUB_PROXY='socks5://localhost:1080'
STATUS=0
download_package package _v1 "$TEST_DIR" "$BASE_URL" > /dev/null 2> "$TEST_DIR/log" || STATUS=$?
assert_equal '1' "$STATUS" 'unsupported proxy scheme rejected'
assert_equal '0' "$(test -e "$TEST_DIR/requests" && echo 1 || echo 0)" 'invalid proxy makes no requests'

exit "$FAILED"
