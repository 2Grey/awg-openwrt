---
layout: default
title: "OpenWrt 25.12.2 bmips/bcm6368"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.2](https://2grey.github.io/awg-openwrt/25.12.2/) / [bmips](https://2grey.github.io/awg-openwrt/25.12.2/bmips/)

- OpenWrt version: `25.12.2`
- Target: `bmips`
- Subtarget: `bcm6368`
- Package architecture: `mips_mips32`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.2/targets/bmips/bcm6368/](https://downloads.openwrt.org/releases/25.12.2/targets/bmips/bcm6368/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6368/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6368/amneziawg-tools-3.0.20260805-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6368/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6368/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6368/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [luci-i18n-amneziawg-ru-0.260808.35881.apk](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6368/luci-i18n-amneziawg-ru-0.260808.35881.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6368/luci-proto-amneziawg-3.0.0-r1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.2/bmips/bcm6368/packages.adb)
