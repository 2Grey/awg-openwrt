---
layout: default
title: "OpenWrt 25.12.0 qoriq/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.0](https://2grey.github.io/awg-openwrt/25.12.0/) / [qoriq](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/)

- OpenWrt version: `25.12.0`
- Target: `qoriq`
- Subtarget: `generic`
- Package architecture: `powerpc64_e5500`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.0/targets/qoriq/generic/](https://downloads.openwrt.org/releases/25.12.0/targets/qoriq/generic/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.0_powerpc64_e5500_qoriq_generic.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/amneziawg-tools_v25.12.0_powerpc64_e5500_qoriq_generic.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/index.json)
- [kmod-amneziawg-6.12.71.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/kmod-amneziawg-6.12.71.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.71.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/kmod-amneziawg-6.12.71.3.1.20260812-r1.apk)
- [kmod-amneziawg-6.12.71.3.1.20260828-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/kmod-amneziawg-6.12.71.3.1.20260828-r1.apk)
- [kmod-amneziawg_v25.12.0_powerpc64_e5500_qoriq_generic.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/kmod-amneziawg_v25.12.0_powerpc64_e5500_qoriq_generic.apk)
- [luci-i18n-amneziawg-ru-0.260808.41177.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/luci-i18n-amneziawg-ru-0.260808.41177.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.0_powerpc64_e5500_qoriq_generic.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/luci-i18n-amneziawg-ru_v25.12.0_powerpc64_e5500_qoriq_generic.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg-3.1.1-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/luci-proto-amneziawg-3.1.1-r1.apk)
- [luci-proto-amneziawg_v25.12.0_powerpc64_e5500_qoriq_generic.apk](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/luci-proto-amneziawg_v25.12.0_powerpc64_e5500_qoriq_generic.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.0/qoriq/generic/packages.adb)
