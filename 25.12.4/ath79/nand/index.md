---
layout: default
title: "OpenWrt 25.12.4 ath79/nand"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.4](https://2grey.github.io/awg-openwrt/25.12.4/) / [ath79](https://2grey.github.io/awg-openwrt/25.12.4/ath79/)

- OpenWrt version: `25.12.4`
- Target: `ath79`
- Subtarget: `nand`
- Package architecture: `mips_24kc`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.4/targets/ath79/nand/](https://downloads.openwrt.org/releases/25.12.4/targets/ath79/nand/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.4_mips_24kc_ath79_nand.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/amneziawg-tools_v25.12.4_mips_24kc_ath79_nand.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/index.json)
- [kmod-amneziawg-6.12.87.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/kmod-amneziawg-6.12.87.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.87.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/kmod-amneziawg-6.12.87.3.1.20260812-r1.apk)
- [kmod-amneziawg-6.12.87.3.1.20260828-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/kmod-amneziawg-6.12.87.3.1.20260828-r1.apk)
- [kmod-amneziawg_v25.12.4_mips_24kc_ath79_nand.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/kmod-amneziawg_v25.12.4_mips_24kc_ath79_nand.apk)
- [luci-i18n-amneziawg-ru-0.260807.37483.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/luci-i18n-amneziawg-ru-0.260807.37483.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.4_mips_24kc_ath79_nand.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/luci-i18n-amneziawg-ru_v25.12.4_mips_24kc_ath79_nand.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg-3.1.1-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/luci-proto-amneziawg-3.1.1-r1.apk)
- [luci-proto-amneziawg_v25.12.4_mips_24kc_ath79_nand.apk](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/luci-proto-amneziawg_v25.12.4_mips_24kc_ath79_nand.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.4/ath79/nand/packages.adb)
