---
layout: default
title: "OpenWrt 25.12.4 bcm27xx/bcm2711"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.4](https://2grey.github.io/awg-openwrt/25.12.4/) / [bcm27xx](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/)

- OpenWrt version: `25.12.4`
- Target: `bcm27xx`
- Subtarget: `bcm2711`
- Package architecture: `aarch64_cortex-a72`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.4/targets/bcm27xx/bcm2711/](https://downloads.openwrt.org/releases/25.12.4/targets/bcm27xx/bcm2711/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.4_aarch64_cortex-a72_bcm27xx_bcm2711.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/amneziawg-tools_v25.12.4_aarch64_cortex-a72_bcm27xx_bcm2711.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/index.json)
- [kmod-amneziawg-6.12.87.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/kmod-amneziawg-6.12.87.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.87.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/kmod-amneziawg-6.12.87.3.1.20260812-r1.apk)
- [kmod-amneziawg-6.12.87.3.1.20260828-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/kmod-amneziawg-6.12.87.3.1.20260828-r1.apk)
- [kmod-amneziawg_v25.12.4_aarch64_cortex-a72_bcm27xx_bcm2711.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/kmod-amneziawg_v25.12.4_aarch64_cortex-a72_bcm27xx_bcm2711.apk)
- [luci-i18n-amneziawg-ru-0.260807.38933.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/luci-i18n-amneziawg-ru-0.260807.38933.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.4_aarch64_cortex-a72_bcm27xx_bcm2711.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/luci-i18n-amneziawg-ru_v25.12.4_aarch64_cortex-a72_bcm27xx_bcm2711.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg-3.1.1-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/luci-proto-amneziawg-3.1.1-r1.apk)
- [luci-proto-amneziawg_v25.12.4_aarch64_cortex-a72_bcm27xx_bcm2711.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/luci-proto-amneziawg_v25.12.4_aarch64_cortex-a72_bcm27xx_bcm2711.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2711/packages.adb)
