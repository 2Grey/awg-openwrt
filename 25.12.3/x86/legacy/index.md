---
layout: default
title: "OpenWrt 25.12.3 x86/legacy"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.3](https://2grey.github.io/awg-openwrt/25.12.3/) / [x86](https://2grey.github.io/awg-openwrt/25.12.3/x86/)

- OpenWrt version: `25.12.3`
- Target: `x86`
- Subtarget: `legacy`
- Package architecture: `i386_pentium-mmx`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.3/targets/x86/legacy/](https://downloads.openwrt.org/releases/25.12.3/targets/x86/legacy/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.3/x86/legacy/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/x86/legacy/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools_v25.12.3_i386_pentium-mmx_x86_legacy.apk](https://2grey.github.io/awg-openwrt/25.12.3/x86/legacy/amneziawg-tools_v25.12.3_i386_pentium-mmx_x86_legacy.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.3/x86/legacy/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.3/x86/legacy/index.json)
- [kmod-amneziawg-6.12.85.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/x86/legacy/kmod-amneziawg-6.12.85.3.0.20260731-r1.apk)
- [kmod-amneziawg_v25.12.3_i386_pentium-mmx_x86_legacy.apk](https://2grey.github.io/awg-openwrt/25.12.3/x86/legacy/kmod-amneziawg_v25.12.3_i386_pentium-mmx_x86_legacy.apk)
- [luci-i18n-amneziawg-ru-0.260808.24005.apk](https://2grey.github.io/awg-openwrt/25.12.3/x86/legacy/luci-i18n-amneziawg-ru-0.260808.24005.apk)
- [luci-i18n-amneziawg-ru_v25.12.3_i386_pentium-mmx_x86_legacy.apk](https://2grey.github.io/awg-openwrt/25.12.3/x86/legacy/luci-i18n-amneziawg-ru_v25.12.3_i386_pentium-mmx_x86_legacy.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/x86/legacy/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg_v25.12.3_i386_pentium-mmx_x86_legacy.apk](https://2grey.github.io/awg-openwrt/25.12.3/x86/legacy/luci-proto-amneziawg_v25.12.3_i386_pentium-mmx_x86_legacy.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.3/x86/legacy/packages.adb)
