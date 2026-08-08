---
layout: default
title: "OpenWrt 25.12.1 lantiq/xrx200"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.1](https://2grey.github.io/awg-openwrt/25.12.1/) / [lantiq](https://2grey.github.io/awg-openwrt/25.12.1/lantiq/)

- OpenWrt version: `25.12.1`
- Target: `lantiq`
- Subtarget: `xrx200`
- Package architecture: `mips_24kc`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.1/targets/lantiq/xrx200/](https://downloads.openwrt.org/releases/25.12.1/targets/lantiq/xrx200/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.1/lantiq/xrx200/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/lantiq/xrx200/amneziawg-tools-3.0.20260805-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.1/lantiq/xrx200/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.1/lantiq/xrx200/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/lantiq/xrx200/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [luci-i18n-amneziawg-ru-0.260808.36646.apk](https://2grey.github.io/awg-openwrt/25.12.1/lantiq/xrx200/luci-i18n-amneziawg-ru-0.260808.36646.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/lantiq/xrx200/luci-proto-amneziawg-3.0.0-r1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.1/lantiq/xrx200/packages.adb)
