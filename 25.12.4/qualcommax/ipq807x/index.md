---
layout: default
title: "OpenWrt 25.12.4 qualcommax/ipq807x"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.4](https://2grey.github.io/awg-openwrt/25.12.4/) / [qualcommax](https://2grey.github.io/awg-openwrt/25.12.4/qualcommax/)

- OpenWrt version: `25.12.4`
- Target: `qualcommax`
- Subtarget: `ipq807x`
- Package architecture: `aarch64_cortex-a53`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.4/targets/qualcommax/ipq807x/](https://downloads.openwrt.org/releases/25.12.4/targets/qualcommax/ipq807x/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.4/qualcommax/ipq807x/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/qualcommax/ipq807x/amneziawg-tools-3.0.20260805-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.4/qualcommax/ipq807x/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.4/qualcommax/ipq807x/index.json)
- [kmod-amneziawg-6.12.87.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/qualcommax/ipq807x/kmod-amneziawg-6.12.87.3.0.20260731-r1.apk)
- [luci-i18n-amneziawg-ru-0.260807.39027.apk](https://2grey.github.io/awg-openwrt/25.12.4/qualcommax/ipq807x/luci-i18n-amneziawg-ru-0.260807.39027.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/qualcommax/ipq807x/luci-proto-amneziawg-3.0.0-r1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.4/qualcommax/ipq807x/packages.adb)
