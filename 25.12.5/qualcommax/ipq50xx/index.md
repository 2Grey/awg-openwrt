---
layout: default
title: "OpenWrt 25.12.5 qualcommax/ipq50xx"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.5](https://2grey.github.io/awg-openwrt/25.12.5/) / [qualcommax](https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/)

- OpenWrt version: `25.12.5`
- Target: `qualcommax`
- Subtarget: `ipq50xx`
- Package architecture: `aarch64_cortex-a53`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.5/targets/qualcommax/ipq50xx/](https://downloads.openwrt.org/releases/25.12.5/targets/qualcommax/ipq50xx/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/ipq50xx/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/ipq50xx/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/ipq50xx/amneziawg-tools-3.1.20260812-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/ipq50xx/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/ipq50xx/index.json)
- [kmod-amneziawg-6.12.94.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/ipq50xx/kmod-amneziawg-6.12.94.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.94.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/ipq50xx/kmod-amneziawg-6.12.94.3.1.20260812-r1.apk)
- [kmod-amneziawg-6.12.94.3.1.20260828-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/ipq50xx/kmod-amneziawg-6.12.94.3.1.20260828-r1.apk)
- [luci-i18n-amneziawg-ru-0.260807.70997.apk](https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/ipq50xx/luci-i18n-amneziawg-ru-0.260807.70997.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/ipq50xx/luci-i18n-amneziawg-ru-0.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/ipq50xx/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/ipq50xx/luci-proto-amneziawg-3.1.0-r1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.5/qualcommax/ipq50xx/packages.adb)
