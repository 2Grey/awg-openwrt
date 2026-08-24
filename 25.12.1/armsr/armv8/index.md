---
layout: default
title: "OpenWrt 25.12.1 armsr/armv8"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.1](https://2grey.github.io/awg-openwrt/25.12.1/) / [armsr](https://2grey.github.io/awg-openwrt/25.12.1/armsr/)

- OpenWrt version: `25.12.1`
- Target: `armsr`
- Subtarget: `armv8`
- Package architecture: `aarch64_generic`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.1/targets/armsr/armv8/](https://downloads.openwrt.org/releases/25.12.1/targets/armsr/armv8/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.1_aarch64_generic_armsr_armv8.apk](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/amneziawg-tools_v25.12.1_aarch64_generic_armsr_armv8.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.74.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/kmod-amneziawg-6.12.74.3.1.20260812-r1.apk)
- [kmod-amneziawg_v25.12.1_aarch64_generic_armsr_armv8.apk](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/kmod-amneziawg_v25.12.1_aarch64_generic_armsr_armv8.apk)
- [luci-i18n-amneziawg-ru-0.260808.40215.apk](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/luci-i18n-amneziawg-ru-0.260808.40215.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.1_aarch64_generic_armsr_armv8.apk](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/luci-i18n-amneziawg-ru_v25.12.1_aarch64_generic_armsr_armv8.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg_v25.12.1_aarch64_generic_armsr_armv8.apk](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/luci-proto-amneziawg_v25.12.1_aarch64_generic_armsr_armv8.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.1/armsr/armv8/packages.adb)
