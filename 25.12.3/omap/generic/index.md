---
layout: default
title: "OpenWrt 25.12.3 omap/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.3](https://2grey.github.io/awg-openwrt/25.12.3/) / [omap](https://2grey.github.io/awg-openwrt/25.12.3/omap/)

- OpenWrt version: `25.12.3`
- Target: `omap`
- Subtarget: `generic`
- Package architecture: `arm_cortex-a8_vfpv3`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.3/targets/omap/generic/](https://downloads.openwrt.org/releases/25.12.3/targets/omap/generic/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.3/omap/generic/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/omap/generic/amneziawg-tools-3.0.20260805-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.3/omap/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.3/omap/generic/index.json)
- [kmod-amneziawg-6.12.85.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/omap/generic/kmod-amneziawg-6.12.85.3.0.20260731-r1.apk)
- [luci-i18n-amneziawg-ru-0.260808.23351.apk](https://2grey.github.io/awg-openwrt/25.12.3/omap/generic/luci-i18n-amneziawg-ru-0.260808.23351.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/omap/generic/luci-proto-amneziawg-3.0.0-r1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.3/omap/generic/packages.adb)
