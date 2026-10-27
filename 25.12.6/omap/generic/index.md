---
layout: default
title: "OpenWrt 25.12.6 omap/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.6](https://2grey.github.io/awg-openwrt/25.12.6/) / [omap](https://2grey.github.io/awg-openwrt/25.12.6/omap/)

- OpenWrt version: `25.12.6`
- Target: `omap`
- Subtarget: `generic`
- Package architecture: `arm_cortex-a8_vfpv3`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.6/targets/omap/generic/](https://downloads.openwrt.org/releases/25.12.6/targets/omap/generic/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.6/omap/generic/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.6/omap/generic/amneziawg-tools-3.1.20260812-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.6/omap/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.6/omap/generic/index.json)
- [kmod-amneziawg-6.12.112.3.1.20260906-r1.apk](https://2grey.github.io/awg-openwrt/25.12.6/omap/generic/kmod-amneziawg-6.12.112.3.1.20260906-r1.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.6/omap/generic/luci-i18n-amneziawg-ru-0.apk)
- [luci-proto-amneziawg-3.1.1-r1.apk](https://2grey.github.io/awg-openwrt/25.12.6/omap/generic/luci-proto-amneziawg-3.1.1-r1.apk)
- [luci-proto-amneziawg-3.1.1-r2.apk](https://2grey.github.io/awg-openwrt/25.12.6/omap/generic/luci-proto-amneziawg-3.1.1-r2.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.6/omap/generic/packages.adb)
