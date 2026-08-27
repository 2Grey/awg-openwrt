#!/bin/sh

# Print diagnostic information useful when reporting an AmneziaWG issue.
# Keep this script compatible with BusyBox ash used by OpenWrt.

UNKNOWN="unknown"
LEGACY_FEED_PATTERN="slava-shchipunov.github.io/awg-openwrt"

APK_REPOSITORIES_FILE=${APK_REPOSITORIES_FILE:-/etc/apk/repositories}
APK_REPOSITORIES_DIR=${APK_REPOSITORIES_DIR:-/etc/apk/repositories.d}
APK_WORLD_FILE=${APK_WORLD_FILE:-/etc/apk/world}
OPKG_CONFIG_DIR=${OPKG_CONFIG_DIR:-/etc/opkg}
LUCI_PROTOCOL_FILE=${LUCI_PROTOCOL_FILE:-/www/luci-static/resources/protocol/amneziawg.js}

get_json_value() {
    JSON=$1
    FILTER=$2

    if command -v jsonfilter >/dev/null 2>&1; then
        printf '%s\n' "$JSON" | jsonfilter -e "$FILTER" 2>/dev/null
    fi
}

get_release_file_value() {
    KEY=$1

    [ -r /etc/openwrt_release ] || return 0
    sed -n "s/^${KEY}=['\"]\\{0,1\\}\([^'\"]*\)['\"]\\{0,1\\}$/\\1/p" \
        /etc/openwrt_release | head -n 1
}

detect_package_manager() {
    if command -v apk >/dev/null 2>&1; then
        PACKAGE_MANAGER="apk"
    elif command -v opkg >/dev/null 2>&1; then
        PACKAGE_MANAGER="opkg"
    else
        PACKAGE_MANAGER=""
    fi
}

installed_package_version() {
    PACKAGE_NAME=$1

    case "$PACKAGE_MANAGER" in
        apk)
            apk info -e "$PACKAGE_NAME" >/dev/null 2>&1 || return 1
            apk info "$PACKAGE_NAME" 2>/dev/null |
                sed -n "s/^${PACKAGE_NAME}-\\(.*\\) description:$/\\1/p" | head -n 1
            ;;
        opkg)
            opkg status "$PACKAGE_NAME" 2>/dev/null |
                awk '
                    /^Status: / { installed = ($0 ~ / installed$/) }
                    /^Version: / { version = substr($0, 10) }
                    END { if (installed && version != "") print version }
                '
            ;;
        *)
            return 1
            ;;
    esac
}

extract_last_awg_release_from_log() {
    sed -n 's/.*amneziawg: AmneziaWG \([^[:space:]]*\) loaded\..*/\1/p' |
        tail -n 1
}

print_release_info() {
    BOARD_INFO=""
    if command -v ubus >/dev/null 2>&1; then
        BOARD_INFO=$(ubus call system board 2>/dev/null || true)
    fi

    OPENWRT_DESCRIPTION=$(get_json_value "$BOARD_INFO" '@.release.description')
    OPENWRT_VERSION=$(get_json_value "$BOARD_INFO" '@.release.version')
    RELEASE_TARGET=$(get_json_value "$BOARD_INFO" '@.release.target')

    [ -n "$OPENWRT_VERSION" ] || OPENWRT_VERSION=$(get_release_file_value DISTRIB_RELEASE)
    [ -n "$RELEASE_TARGET" ] || RELEASE_TARGET=$(get_release_file_value DISTRIB_TARGET)

    if [ -n "$OPENWRT_DESCRIPTION" ]; then
        printf 'OpenWrt: %s\n' "$OPENWRT_DESCRIPTION"
    elif [ -n "$OPENWRT_VERSION" ]; then
        printf 'OpenWrt: %s\n' "$OPENWRT_VERSION"
    else
        printf 'OpenWrt: %s\n' "$UNKNOWN"
    fi

    if [ -n "$RELEASE_TARGET" ] && [ "${RELEASE_TARGET#*/}" != "$RELEASE_TARGET" ]; then
        printf 'Target: %s\n' "${RELEASE_TARGET%%/*}"
        printf 'Subtarget: %s\n' "${RELEASE_TARGET#*/}"
    else
        printf 'Target: %s\n' "$UNKNOWN"
        printf 'Subtarget: %s\n' "$UNKNOWN"
    fi
}

print_awg_packages() {
    FOUND_PACKAGE=0

    printf '\nInstalled awg-openwrt packages:\n'
    for PACKAGE_NAME in \
        amneziawg-tools \
        kmod-amneziawg \
        luci-app-amneziawg \
        luci-proto-amneziawg \
        luci-i18n-amneziawg-ru; do
        PACKAGE_VERSION=$(installed_package_version "$PACKAGE_NAME" 2>/dev/null || true)
        if [ -n "$PACKAGE_VERSION" ]; then
            printf '%s: %s\n' "$PACKAGE_NAME" "$PACKAGE_VERSION"
            FOUND_PACKAGE=1
        fi
    done

    [ "$FOUND_PACKAGE" -eq 1 ] || printf '(none)\n'
}

print_legacy_feed_file() {
    LEGACY_CONFIG_FILE=$1
    [ -f "$LEGACY_CONFIG_FILE" ] || return 0
    grep -F -q "$LEGACY_FEED_PATTERN" "$LEGACY_CONFIG_FILE" 2>/dev/null || return 0

    awk -v file="$LEGACY_CONFIG_FILE" -v pattern="$LEGACY_FEED_PATTERN" '
        index($0, pattern) { printf "%s:%d:%s\n", file, NR, $0 }
    ' "$LEGACY_CONFIG_FILE"
    LEGACY_FEED_FOUND=1
}

print_legacy_feeds() {
    LEGACY_FEED_FOUND=0
    printf '\nLegacy awg-openwrt feeds:\n'

    print_legacy_feed_file "$APK_REPOSITORIES_FILE"
    for LEGACY_CONFIG_FILE in "$APK_REPOSITORIES_DIR"/*.list "$OPKG_CONFIG_DIR"/*.conf; do
        print_legacy_feed_file "$LEGACY_CONFIG_FILE"
    done

    [ "$LEGACY_FEED_FOUND" -eq 1 ] || printf '(none)\n'
}

print_apk_world_constraints() {
    printf '\nAmneziaWG APK world constraints:\n'
    if [ "$PACKAGE_MANAGER" != "apk" ]; then
        printf '(not applicable: apk is not active)\n'
        return
    fi
    if [ ! -r "$APK_WORLD_FILE" ]; then
        printf '(world file not found)\n'
        return
    fi

    APK_WORLD_MATCHES=$(grep -E \
        '^(amneziawg-tools|kmod-amneziawg|luci-app-amneziawg|luci-proto-amneziawg|luci-i18n-amneziawg-ru)([^[:alnum:]_-].*)?$' \
        "$APK_WORLD_FILE" 2>/dev/null || true)
    if [ -n "$APK_WORLD_MATCHES" ]; then
        printf '%s\n' "$APK_WORLD_MATCHES"
    else
        printf '(none)\n'
    fi
}

print_luci_parser() {
    printf '\nInstalled LuCI parser:\n'
    printf 'Path: %s\n' "$LUCI_PROTOCOL_FILE"

    if [ ! -r "$LUCI_PROTOCOL_FILE" ]; then
        printf 'AWG 3.x range support: parser file not found\n'
    elif grep -q 'validateUint16Range(null, pconf.peer_persistentkeepalive' "$LUCI_PROTOCOL_FILE"; then
        printf 'AWG 3.x range support: present\n'
    elif grep -q "stubValidator.apply('port', pconf.peer_persistentkeepalive" "$LUCI_PROTOCOL_FILE"; then
        printf 'AWG 3.x range support: missing (legacy parser detected)\n'
    else
        printf 'AWG 3.x range support: unknown parser version\n'
    fi
}

print_loaded_awg_version() {
    SYS_MODULE_DIR=${SYS_MODULE_DIR:-/sys/module}
    MODULE_DIR="$SYS_MODULE_DIR/amneziawg"

    if [ ! -d "$MODULE_DIR" ]; then
        printf '\nLoaded AmneziaWG kernel module: not loaded\n'
        return
    fi

    AWG_RELEASE=""
    if [ -r "$MODULE_DIR/version" ]; then
        AWG_RELEASE=$(cat "$MODULE_DIR/version" 2>/dev/null || true)
    fi
    if [ -z "$AWG_RELEASE" ] && command -v dmesg >/dev/null 2>&1; then
        AWG_RELEASE=$(dmesg 2>/dev/null | extract_last_awg_release_from_log)
    fi
    [ -n "$AWG_RELEASE" ] || AWG_RELEASE=$UNKNOWN

    printf '\nLoaded AmneziaWG kernel module: %s\n' "$AWG_RELEASE"
}

main() {
    printf '#####################################\n'
    detect_package_manager
    print_release_info
    print_awg_packages
    print_legacy_feeds
    print_apk_world_constraints
    print_luci_parser
    print_loaded_awg_version
    printf '#####################################\n'
}

if [ "${AMNEZIAWG_CHECK_SOURCE_ONLY:-0}" != "1" ]; then
    main "$@"
fi
