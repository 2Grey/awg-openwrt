---
layout: default
title: "OpenWrt 25.12.4 bcm27xx/bcm2709"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.4](https://2grey.github.io/awg-openwrt/25.12.4/) / [bcm27xx](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/)

- OpenWrt version: `25.12.4`
- Target: `bcm27xx`
- Subtarget: `bcm2709`
- Package architecture: `arm_cortex-a7_neon-vfpv4`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.4/targets/bcm27xx/bcm2709/](https://downloads.openwrt.org/releases/25.12.4/targets/bcm27xx/bcm2709/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2709/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2709/amneziawg-tools-3.0.20260805-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2709/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2709/index.json)
- [kmod-amneziawg-6.12.87.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2709/kmod-amneziawg-6.12.87.3.0.20260731-r1.apk)
- [luci-i18n-amneziawg-ru-0.260807.38187.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2709/luci-i18n-amneziawg-ru-0.260807.38187.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2709/luci-proto-amneziawg-3.0.0-r1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.4/bcm27xx/bcm2709/packages.adb)
