---
layout: default
title: "OpenWrt 25.12.1 qualcommax/ipq60xx"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.1](https://2grey.github.io/awg-openwrt/25.12.1/) / [qualcommax](https://2grey.github.io/awg-openwrt/25.12.1/qualcommax/)

- OpenWrt version: `25.12.1`
- Target: `qualcommax`
- Subtarget: `ipq60xx`
- Package architecture: `aarch64_cortex-a53`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.1/targets/qualcommax/ipq60xx/](https://downloads.openwrt.org/releases/25.12.1/targets/qualcommax/ipq60xx/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.1/qualcommax/ipq60xx/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/qualcommax/ipq60xx/amneziawg-tools-3.0.20260805-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.1/qualcommax/ipq60xx/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.1/qualcommax/ipq60xx/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/qualcommax/ipq60xx/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [luci-i18n-amneziawg-ru-0.260808.39048.apk](https://2grey.github.io/awg-openwrt/25.12.1/qualcommax/ipq60xx/luci-i18n-amneziawg-ru-0.260808.39048.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/qualcommax/ipq60xx/luci-proto-amneziawg-3.0.0-r1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.1/qualcommax/ipq60xx/packages.adb)
