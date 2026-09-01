---
layout: default
title: "OpenWrt 25.12.2 malta/be"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.2](https://2grey.github.io/awg-openwrt/25.12.2/) / [malta](https://2grey.github.io/awg-openwrt/25.12.2/malta/)

- OpenWrt version: `25.12.2`
- Target: `malta`
- Subtarget: `be`
- Package architecture: `mips_24kc`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.2/targets/malta/be/](https://downloads.openwrt.org/releases/25.12.2/targets/malta/be/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.2/malta/be/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.2_mips_24kc_malta_be.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/amneziawg-tools_v25.12.2_mips_24kc_malta_be.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.74.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/kmod-amneziawg-6.12.74.3.1.20260812-r1.apk)
- [kmod-amneziawg-6.12.74.3.1.20260828-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/kmod-amneziawg-6.12.74.3.1.20260828-r1.apk)
- [kmod-amneziawg_v25.12.2_mips_24kc_malta_be.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/kmod-amneziawg_v25.12.2_mips_24kc_malta_be.apk)
- [luci-i18n-amneziawg-ru-0.260808.26811.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/luci-i18n-amneziawg-ru-0.260808.26811.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.2_mips_24kc_malta_be.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/luci-i18n-amneziawg-ru_v25.12.2_mips_24kc_malta_be.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg-3.1.1-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/luci-proto-amneziawg-3.1.1-r1.apk)
- [luci-proto-amneziawg_v25.12.2_mips_24kc_malta_be.apk](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/luci-proto-amneziawg_v25.12.2_mips_24kc_malta_be.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.2/malta/be/packages.adb)
