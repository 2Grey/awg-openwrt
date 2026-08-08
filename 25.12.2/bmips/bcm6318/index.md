---
layout: default
title: "OpenWrt 25.12.2 bmips/bcm6318"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.2](https://2grey.github.io/awg-openwrt/25.12.2/) / [bmips](https://2grey.github.io/awg-openwrt/25.12.2/bmips/)

- OpenWrt version: `25.12.2`
- Target: `bmips`
- Subtarget: `bcm6318`
- Package architecture: `mips_mips32`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.2/targets/bmips/bcm6318/](https://downloads.openwrt.org/releases/25.12.2/targets/bmips/bcm6318/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6318/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6318/amneziawg-tools-3.0.20260805-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6318/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6318/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6318/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [luci-i18n-amneziawg-ru-0.260808.27627.apk](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6318/luci-i18n-amneziawg-ru-0.260808.27627.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6318/luci-proto-amneziawg-3.0.0-r1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6318/packages.adb)
