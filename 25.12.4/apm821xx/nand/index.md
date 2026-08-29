---
layout: default
title: "OpenWrt 25.12.4 apm821xx/nand"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.4](https://2grey.github.io/awg-openwrt/25.12.4/) / [apm821xx](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/)

- OpenWrt version: `25.12.4`
- Target: `apm821xx`
- Subtarget: `nand`
- Package architecture: `powerpc_464fp`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.4/targets/apm821xx/nand/](https://downloads.openwrt.org/releases/25.12.4/targets/apm821xx/nand/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.4_powerpc_464fp_apm821xx_nand.apk](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/amneziawg-tools_v25.12.4_powerpc_464fp_apm821xx_nand.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/index.json)
- [kmod-amneziawg-6.12.87.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/kmod-amneziawg-6.12.87.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.87.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/kmod-amneziawg-6.12.87.3.1.20260812-r1.apk)
- [kmod-amneziawg-6.12.87.3.1.20260828-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/kmod-amneziawg-6.12.87.3.1.20260828-r1.apk)
- [kmod-amneziawg_v25.12.4_powerpc_464fp_apm821xx_nand.apk](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/kmod-amneziawg_v25.12.4_powerpc_464fp_apm821xx_nand.apk)
- [luci-i18n-amneziawg-ru-0.260807.36789.apk](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/luci-i18n-amneziawg-ru-0.260807.36789.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.4_powerpc_464fp_apm821xx_nand.apk](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/luci-i18n-amneziawg-ru_v25.12.4_powerpc_464fp_apm821xx_nand.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg_v25.12.4_powerpc_464fp_apm821xx_nand.apk](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/luci-proto-amneziawg_v25.12.4_powerpc_464fp_apm821xx_nand.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.4/apm821xx/nand/packages.adb)
