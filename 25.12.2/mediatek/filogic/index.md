---
layout: default
title: "OpenWrt 25.12.2 mediatek/filogic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.2](https://2grey.github.io/awg-openwrt/25.12.2/) / [mediatek](https://2grey.github.io/awg-openwrt/25.12.2/mediatek/)

- OpenWrt version: `25.12.2`
- Target: `mediatek`
- Subtarget: `filogic`
- Package architecture: `aarch64_cortex-a53`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.2/targets/mediatek/filogic/](https://downloads.openwrt.org/releases/25.12.2/targets/mediatek/filogic/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.2/mediatek/filogic/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/mediatek/filogic/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools_v25.12.2_aarch64_cortex-a53_mediatek_filogic.apk](https://2grey.github.io/awg-openwrt/25.12.2/mediatek/filogic/amneziawg-tools_v25.12.2_aarch64_cortex-a53_mediatek_filogic.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.2/mediatek/filogic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.2/mediatek/filogic/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/mediatek/filogic/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [kmod-amneziawg_v25.12.2_aarch64_cortex-a53_mediatek_filogic.apk](https://2grey.github.io/awg-openwrt/25.12.2/mediatek/filogic/kmod-amneziawg_v25.12.2_aarch64_cortex-a53_mediatek_filogic.apk)
- [luci-i18n-amneziawg-ru-0.260808.28288.apk](https://2grey.github.io/awg-openwrt/25.12.2/mediatek/filogic/luci-i18n-amneziawg-ru-0.260808.28288.apk)
- [luci-i18n-amneziawg-ru_v25.12.2_aarch64_cortex-a53_mediatek_filogic.apk](https://2grey.github.io/awg-openwrt/25.12.2/mediatek/filogic/luci-i18n-amneziawg-ru_v25.12.2_aarch64_cortex-a53_mediatek_filogic.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/mediatek/filogic/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg_v25.12.2_aarch64_cortex-a53_mediatek_filogic.apk](https://2grey.github.io/awg-openwrt/25.12.2/mediatek/filogic/luci-proto-amneziawg_v25.12.2_aarch64_cortex-a53_mediatek_filogic.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.2/mediatek/filogic/packages.adb)
