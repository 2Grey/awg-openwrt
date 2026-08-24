---
layout: default
title: "OpenWrt 25.12.0 apm821xx/sata"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.0](https://2grey.github.io/awg-openwrt/25.12.0/) / [apm821xx](https://2grey.github.io/awg-openwrt/25.12.0/apm821xx/)

- OpenWrt version: `25.12.0`
- Target: `apm821xx`
- Subtarget: `sata`
- Package architecture: `powerpc_464fp`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.0/targets/apm821xx/sata/](https://downloads.openwrt.org/releases/25.12.0/targets/apm821xx/sata/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.0/apm821xx/sata/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/apm821xx/sata/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools_v25.12.0_powerpc_464fp_apm821xx_sata.apk](https://2grey.github.io/awg-openwrt/25.12.0/apm821xx/sata/amneziawg-tools_v25.12.0_powerpc_464fp_apm821xx_sata.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.0/apm821xx/sata/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.0/apm821xx/sata/index.json)
- [kmod-amneziawg-6.12.71.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/apm821xx/sata/kmod-amneziawg-6.12.71.3.0.20260731-r1.apk)
- [kmod-amneziawg_v25.12.0_powerpc_464fp_apm821xx_sata.apk](https://2grey.github.io/awg-openwrt/25.12.0/apm821xx/sata/kmod-amneziawg_v25.12.0_powerpc_464fp_apm821xx_sata.apk)
- [luci-i18n-amneziawg-ru-0.260808.41057.apk](https://2grey.github.io/awg-openwrt/25.12.0/apm821xx/sata/luci-i18n-amneziawg-ru-0.260808.41057.apk)
- [luci-i18n-amneziawg-ru_v25.12.0_powerpc_464fp_apm821xx_sata.apk](https://2grey.github.io/awg-openwrt/25.12.0/apm821xx/sata/luci-i18n-amneziawg-ru_v25.12.0_powerpc_464fp_apm821xx_sata.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/apm821xx/sata/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg_v25.12.0_powerpc_464fp_apm821xx_sata.apk](https://2grey.github.io/awg-openwrt/25.12.0/apm821xx/sata/luci-proto-amneziawg_v25.12.0_powerpc_464fp_apm821xx_sata.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.0/apm821xx/sata/packages.adb)
