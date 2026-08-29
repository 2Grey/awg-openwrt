---
layout: default
title: "OpenWrt 25.12.3 layerscape/armv8_64b"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.3](https://2grey.github.io/awg-openwrt/25.12.3/) / [layerscape](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/)

- OpenWrt version: `25.12.3`
- Target: `layerscape`
- Subtarget: `armv8_64b`
- Package architecture: `aarch64_generic`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.3/targets/layerscape/armv8_64b/](https://downloads.openwrt.org/releases/25.12.3/targets/layerscape/armv8_64b/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.3_aarch64_generic_layerscape_armv8_64b.apk](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/amneziawg-tools_v25.12.3_aarch64_generic_layerscape_armv8_64b.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/index.json)
- [kmod-amneziawg-6.12.85.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/kmod-amneziawg-6.12.85.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.85.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/kmod-amneziawg-6.12.85.3.1.20260812-r1.apk)
- [kmod-amneziawg-6.12.85.3.1.20260828-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/kmod-amneziawg-6.12.85.3.1.20260828-r1.apk)
- [kmod-amneziawg_v25.12.3_aarch64_generic_layerscape_armv8_64b.apk](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/kmod-amneziawg_v25.12.3_aarch64_generic_layerscape_armv8_64b.apk)
- [luci-i18n-amneziawg-ru-0.260808.22609.apk](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/luci-i18n-amneziawg-ru-0.260808.22609.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.3_aarch64_generic_layerscape_armv8_64b.apk](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/luci-i18n-amneziawg-ru_v25.12.3_aarch64_generic_layerscape_armv8_64b.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg_v25.12.3_aarch64_generic_layerscape_armv8_64b.apk](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/luci-proto-amneziawg_v25.12.3_aarch64_generic_layerscape_armv8_64b.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.3/layerscape/armv8_64b/packages.adb)
