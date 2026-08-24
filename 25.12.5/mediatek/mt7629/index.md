---
layout: default
title: "OpenWrt 25.12.5 mediatek/mt7629"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.5](https://2grey.github.io/awg-openwrt/25.12.5/) / [mediatek](https://2grey.github.io/awg-openwrt/25.12.5/mediatek/)

- OpenWrt version: `25.12.5`
- Target: `mediatek`
- Subtarget: `mt7629`
- Package architecture: `arm_cortex-a7`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.5/targets/mediatek/mt7629/](https://downloads.openwrt.org/releases/25.12.5/targets/mediatek/mt7629/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.5/mediatek/mt7629/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/mediatek/mt7629/amneziawg-tools-3.0.20260805-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.5/mediatek/mt7629/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.5/mediatek/mt7629/index.json)
- [kmod-amneziawg-6.12.94.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/mediatek/mt7629/kmod-amneziawg-6.12.94.3.0.20260731-r1.apk)
- [luci-i18n-amneziawg-ru-0.260807.66067.apk](https://2grey.github.io/awg-openwrt/25.12.5/mediatek/mt7629/luci-i18n-amneziawg-ru-0.260807.66067.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/mediatek/mt7629/luci-proto-amneziawg-3.0.0-r1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.5/mediatek/mt7629/packages.adb)
