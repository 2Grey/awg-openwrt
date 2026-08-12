#!/bin/sh

# Installer for stable OpenWrt releases. Keep this script compatible with
# BusyBox ash: it is commonly executed directly on a router with /bin/sh.

PKG_MANAGER=""
PKG_EXT=""
AWG_DIR=""
AWG_VERSION="1.0"

ASK_FOR_TRANSLATION=1
ASK_FOR_INTERFACE_CONFIG=1

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
Usage: ${0##*/} [-h] [-e] [-n]
    -h    show this help
    -e    do not install 'luci-i18n-amneziawg-ru' package
    -n    do not configure the amneziawg interface
EOF
}

parse_options() {
    while getopts ":ehn" OPT; do
        case "$OPT" in
            h)
                usage
                exit 0
                ;;
            e) ASK_FOR_TRANSLATION=0 ;;
            n) ASK_FOR_INTERFACE_CONFIG=0 ;;
            \?)
                printf 'Unknown option -%s\n' "$OPTARG" >&2
                usage >&2
                exit 1
                ;;
        esac
    done
    shift "$((OPTIND - 1))"
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
    if wget -q -O "$DOWNLOAD_DIR/$DOWNLOAD_FILE" "${DOWNLOAD_BASE_URL}${DOWNLOAD_FILE}" &&
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
    if wget -q -O "$DOWNLOAD_DIR/$DOWNLOAD_FILE" "${DOWNLOAD_BASE_URL}${DOWNLOAD_FILE}" &&
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
        printf '%s already installed\n' "$INSTALL_PACKAGE_NAME"
        return
    fi

    if ! INSTALL_PACKAGE_FILE=$(
        download_package \
            "$INSTALL_PACKAGE_NAME" \
            "$PKGPOSTFIX_BASE" \
            "$AWG_DIR" \
            "${BASE_URL}v${VERSION}/"
    ); then
        die "Error downloading ${INSTALL_PACKAGE_NAME}. Please, install ${INSTALL_PACKAGE_NAME} manually and run the script again"
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

    AWG_DIR=$(mktemp -d /tmp/amneziawg.XXXXXX) ||
        die "Unable to create a temporary download directory."

    install_release_package "kmod-amneziawg"
    install_release_package "amneziawg-tools"

    if awg --version 2>/dev/null | grep -q 'amneziawg-tools v3\.'; then
        AWG_VERSION="3.0"
    fi
    print_info "Detected AWG version: $AWG_VERSION"

    # Either LuCI package provides the interface; do not install both variants.
    if is_pkg_installed "luci-proto-amneziawg" || is_pkg_installed "luci-app-amneziawg"; then
        printf '%s already installed\n' "$LUCI_PACKAGE_NAME"
    else
        install_release_package "$LUCI_PACKAGE_NAME"
    fi

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

read_prompt() {
    PROMPT_TEXT=$1
    PROMPT_DEFAULT=${2-}

    printf '%s\n' "$PROMPT_TEXT"
    if ! IFS= read -r READ_VALUE; then
        die "Input aborted."
    fi
    [ -n "$READ_VALUE" ] || READ_VALUE=$PROMPT_DEFAULT
}

collect_interface_settings() {
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

    if [ "$AWG_VERSION" != "1.0" ]; then
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
    if [ "$AWG_VERSION" = "3.0" ]; then
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
}

uci_set() {
    uci set "$1=$2"
}

uci_set_if_present() {
    if [ -n "$2" ]; then
        uci_set "$1" "$2"
    fi
}

write_network_config() {
    uci_set "network.${INTERFACE_NAME}" "interface"
    uci_set "network.${INTERFACE_NAME}.proto" "$PROTO"
    uci_set "network.${INTERFACE_NAME}.private_key" "$AWG_PRIVATE_KEY_INT"
    uci_set "network.${INTERFACE_NAME}.listen_port" "51821"
    uci_set "network.${INTERFACE_NAME}.addresses" "$AWG_IP"

    uci_set "network.${INTERFACE_NAME}.awg_jc" "$AWG_JC"
    uci_set "network.${INTERFACE_NAME}.awg_jmin" "$AWG_JMIN"
    uci_set "network.${INTERFACE_NAME}.awg_jmax" "$AWG_JMAX"
    uci_set "network.${INTERFACE_NAME}.awg_s1" "$AWG_S1"
    uci_set "network.${INTERFACE_NAME}.awg_s2" "$AWG_S2"
    uci_set "network.${INTERFACE_NAME}.awg_h1" "$AWG_H1"
    uci_set "network.${INTERFACE_NAME}.awg_h2" "$AWG_H2"
    uci_set "network.${INTERFACE_NAME}.awg_h3" "$AWG_H3"
    uci_set "network.${INTERFACE_NAME}.awg_h4" "$AWG_H4"

    if [ "$AWG_VERSION" != "1.0" ]; then
        uci_set_if_present "network.${INTERFACE_NAME}.awg_s3" "$AWG_S3"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_s4" "$AWG_S4"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_i1" "$AWG_I1"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_i2" "$AWG_I2"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_i3" "$AWG_I3"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_i4" "$AWG_I4"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_i5" "$AWG_I5"
    fi

    if [ "$AWG_VERSION" = "3.0" ]; then
        uci_set_if_present "network.${INTERFACE_NAME}.awg_header_protection_key" "$AWG_HEADER_PROTECTION_KEY"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_content_padding_addition" "$AWG_CONTENT_PADDING_ADDITION"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_rekey_after_time" "$AWG_REKEY_AFTER_TIME"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_rekey_timeout" "$AWG_REKEY_TIMEOUT"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_reject_after_time" "$AWG_REJECT_AFTER_TIME"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_keepalive_timeout" "$AWG_KEEPALIVE_TIMEOUT"
        uci_set_if_present "network.${INTERFACE_NAME}.awg_max_handshake_attempts" "$AWG_MAX_HANDSHAKE_ATTEMPTS"
    fi

    if ! uci -q get "network.@${CONFIG_NAME}[0]" >/dev/null 2>&1; then
        uci add network "$CONFIG_NAME" >/dev/null
    fi

    PEER_SECTION="network.@${CONFIG_NAME}[0]"
    uci_set "$PEER_SECTION" "$CONFIG_NAME"
    uci_set "${PEER_SECTION}.name" "${INTERFACE_NAME}_client"
    uci_set "${PEER_SECTION}.public_key" "$AWG_PUBLIC_KEY_INT"
    uci_set "${PEER_SECTION}.preshared_key" "$AWG_PRESHARED_KEY_INT"
    uci_set "${PEER_SECTION}.route_allowed_ips" "1"
    uci_set "${PEER_SECTION}.persistent_keepalive" "$AWG_PERSISTENT_KEEPALIVE"
    uci_set "${PEER_SECTION}.endpoint_host" "$AWG_ENDPOINT_INT"
    uci_set "${PEER_SECTION}.allowed_ips" "0.0.0.0/0"
    uci add_list "${PEER_SECTION}.allowed_ips=::/0"
    uci_set "${PEER_SECTION}.endpoint_port" "$AWG_ENDPOINT_PORT_INT"
    uci commit network
}

firewall_section_exists() {
    FIREWALL_SECTION_TYPE=$1
    FIREWALL_SECTION_NAME=$2

    uci -q show firewall 2>/dev/null |
        grep -q "^firewall\.@${FIREWALL_SECTION_TYPE}\[[0-9][0-9]*\]\.name='${FIREWALL_SECTION_NAME}'$"
}

ensure_firewall_zone() {
    if firewall_section_exists "zone" "$ZONE_NAME"; then
        return
    fi

    print_info "Zone Create"
    uci add firewall zone >/dev/null
    uci_set "firewall.@zone[-1].name" "$ZONE_NAME"
    uci_set "firewall.@zone[-1].network" "$INTERFACE_NAME"
    uci_set "firewall.@zone[-1].forward" "REJECT"
    uci_set "firewall.@zone[-1].output" "ACCEPT"
    uci_set "firewall.@zone[-1].input" "REJECT"
    uci_set "firewall.@zone[-1].masq" "1"
    uci_set "firewall.@zone[-1].mtu_fix" "1"
    uci_set "firewall.@zone[-1].family" "ipv4"
}

ensure_firewall_forwarding() {
    FORWARDING_NAME="${ZONE_NAME}-lan"
    if firewall_section_exists "forwarding" "$FORWARDING_NAME"; then
        return
    fi

    print_info "Configured forwarding"
    uci add firewall forwarding >/dev/null
    uci_set "firewall.@forwarding[-1]" "forwarding"
    uci_set "firewall.@forwarding[-1].name" "$FORWARDING_NAME"
    uci_set "firewall.@forwarding[-1].dest" "$ZONE_NAME"
    uci_set "firewall.@forwarding[-1].src" "lan"
    uci_set "firewall.@forwarding[-1].family" "ipv4"
}

configure_amneziawg_interface() {
    INTERFACE_NAME="awg1"
    CONFIG_NAME="amneziawg_awg1"
    PROTO="amneziawg"
    ZONE_NAME="awg1"

    collect_interface_settings
    write_network_config
    ensure_firewall_zone
    ensure_firewall_forwarding
    uci commit firewall

    service network restart
}

main() {
    parse_options "$@"
    detect_package_manager
    check_repo
    install_awg_packages

    if [ "$ASK_FOR_INTERFACE_CONFIG" -eq 0 ]; then
        return
    fi

    if ask_yes_no "Do you want to configure the amneziawg interface? (y/N):" "n"; then
        configure_amneziawg_interface
    else
        print_info "Skipping amneziawg interface configuration."
    fi
}

trap cleanup_downloads 0
trap 'exit 1' HUP INT TERM

main "$@"
