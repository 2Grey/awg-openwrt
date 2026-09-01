---
layout: default
title: "OpenWrt 25.12.4 lantiq/xway"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.4](https://2grey.github.io/awg-openwrt/25.12.4/) / [lantiq](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/)

- OpenWrt version: `25.12.4`
- Target: `lantiq`
- Subtarget: `xway`
- Package architecture: `mips_24kc`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.4/targets/lantiq/xway/](https://downloads.openwrt.org/releases/25.12.4/targets/lantiq/xway/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.4_mips_24kc_lantiq_xway.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/amneziawg-tools_v25.12.4_mips_24kc_lantiq_xway.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/index.json)
- [kmod-amneziawg-6.12.87.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/kmod-amneziawg-6.12.87.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.87.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/kmod-amneziawg-6.12.87.3.1.20260812-r1.apk)
- [kmod-amneziawg-6.12.87.3.1.20260828-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/kmod-amneziawg-6.12.87.3.1.20260828-r1.apk)
- [kmod-amneziawg_v25.12.4_mips_24kc_lantiq_xway.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/kmod-amneziawg_v25.12.4_mips_24kc_lantiq_xway.apk)
- [luci-i18n-amneziawg-ru-0.260807.37567.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/luci-i18n-amneziawg-ru-0.260807.37567.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.4_mips_24kc_lantiq_xway.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/luci-i18n-amneziawg-ru_v25.12.4_mips_24kc_lantiq_xway.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg-3.1.1-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/luci-proto-amneziawg-3.1.1-r1.apk)
- [luci-proto-amneziawg_v25.12.4_mips_24kc_lantiq_xway.apk](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/luci-proto-amneziawg_v25.12.4_mips_24kc_lantiq_xway.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.4/lantiq/xway/packages.adb)
