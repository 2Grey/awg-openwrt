---
layout: default
title: "OpenWrt 25.12.2 x86/64"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.2](https://2grey.github.io/awg-openwrt/25.12.2/) / [x86](https://2grey.github.io/awg-openwrt/25.12.2/x86/)

- OpenWrt version: `25.12.2`
- Target: `x86`
- Subtarget: `64`
- Package architecture: `x86_64`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.2/targets/x86/64/](https://downloads.openwrt.org/releases/25.12.2/targets/x86/64/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.2/x86/64/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.2_x86_64_x86_64.apk](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/amneziawg-tools_v25.12.2_x86_64_x86_64.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.74.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/kmod-amneziawg-6.12.74.3.1.20260812-r1.apk)
- [kmod-amneziawg-6.12.74.3.1.20260828-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/kmod-amneziawg-6.12.74.3.1.20260828-r1.apk)
- [kmod-amneziawg_v25.12.2_x86_64_x86_64.apk](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/kmod-amneziawg_v25.12.2_x86_64_x86_64.apk)
- [luci-i18n-amneziawg-ru-0.260808.28911.apk](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/luci-i18n-amneziawg-ru-0.260808.28911.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.2_x86_64_x86_64.apk](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/luci-i18n-amneziawg-ru_v25.12.2_x86_64_x86_64.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg_v25.12.2_x86_64_x86_64.apk](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/luci-proto-amneziawg_v25.12.2_x86_64_x86_64.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.2/x86/64/packages.adb)
