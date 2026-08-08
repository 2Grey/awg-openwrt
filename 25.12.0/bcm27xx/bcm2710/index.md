---
layout: default
title: "OpenWrt 25.12.0 bcm27xx/bcm2710"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.0](https://2grey.github.io/awg-openwrt/25.12.0/) / [bcm27xx](https://2grey.github.io/awg-openwrt/25.12.0/bcm27xx/)

- OpenWrt version: `25.12.0`
- Target: `bcm27xx`
- Subtarget: `bcm2710`
- Package architecture: `aarch64_cortex-a53`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.0/targets/bcm27xx/bcm2710/](https://downloads.openwrt.org/releases/25.12.0/targets/bcm27xx/bcm2710/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.0/bcm27xx/bcm2710/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/bcm27xx/bcm2710/amneziawg-tools-3.0.20260805-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.0/bcm27xx/bcm2710/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.0/bcm27xx/bcm2710/index.json)
- [kmod-amneziawg-6.12.71.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/bcm27xx/bcm2710/kmod-amneziawg-6.12.71.3.0.20260731-r1.apk)
- [luci-i18n-amneziawg-ru-0.260808.49257.apk](https://2grey.github.io/awg-openwrt/25.12.0/bcm27xx/bcm2710/luci-i18n-amneziawg-ru-0.260808.49257.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/bcm27xx/bcm2710/luci-proto-amneziawg-3.0.0-r1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.0/bcm27xx/bcm2710/packages.adb)
