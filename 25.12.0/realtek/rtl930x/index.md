---
layout: default
title: "OpenWrt 25.12.0 realtek/rtl930x"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.0](https://2grey.github.io/awg-openwrt/25.12.0/) / [realtek](https://2grey.github.io/awg-openwrt/25.12.0/realtek/)

- OpenWrt version: `25.12.0`
- Target: `realtek`
- Subtarget: `rtl930x`
- Package architecture: `mips_24kc`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.0/targets/realtek/rtl930x/](https://downloads.openwrt.org/releases/25.12.0/targets/realtek/rtl930x/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.0/realtek/rtl930x/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/realtek/rtl930x/amneziawg-tools-3.0.20260805-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.0/realtek/rtl930x/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.0/realtek/rtl930x/index.json)
- [kmod-amneziawg-6.12.71.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/realtek/rtl930x/kmod-amneziawg-6.12.71.3.0.20260731-r1.apk)
- [luci-i18n-amneziawg-ru-0.260808.43816.apk](https://2grey.github.io/awg-openwrt/25.12.0/realtek/rtl930x/luci-i18n-amneziawg-ru-0.260808.43816.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/realtek/rtl930x/luci-proto-amneziawg-3.0.0-r1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.0/realtek/rtl930x/packages.adb)
