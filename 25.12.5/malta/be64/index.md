---
layout: default
title: "OpenWrt 25.12.5 malta/be64"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.5](https://2grey.github.io/awg-openwrt/25.12.5/) / [malta](https://2grey.github.io/awg-openwrt/25.12.5/malta/)

- OpenWrt version: `25.12.5`
- Target: `malta`
- Subtarget: `be64`
- Package architecture: `mips64_mips64r2`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.5/targets/malta/be64/](https://downloads.openwrt.org/releases/25.12.5/targets/malta/be64/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.5/malta/be64/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be64/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools_v25.12.5_mips64_mips64r2_malta_be64.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be64/amneziawg-tools_v25.12.5_mips64_mips64r2_malta_be64.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.5/malta/be64/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.5/malta/be64/index.json)
- [kmod-amneziawg-6.12.94.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be64/kmod-amneziawg-6.12.94.3.0.20260731-r1.apk)
- [kmod-amneziawg_v25.12.5_mips64_mips64r2_malta_be64.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be64/kmod-amneziawg_v25.12.5_mips64_mips64r2_malta_be64.apk)
- [luci-i18n-amneziawg-ru-0.260807.69329.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be64/luci-i18n-amneziawg-ru-0.260807.69329.apk)
- [luci-i18n-amneziawg-ru_v25.12.5_mips64_mips64r2_malta_be64.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be64/luci-i18n-amneziawg-ru_v25.12.5_mips64_mips64r2_malta_be64.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be64/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg_v25.12.5_mips64_mips64r2_malta_be64.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be64/luci-proto-amneziawg_v25.12.5_mips64_mips64r2_malta_be64.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.5/malta/be64/packages.adb)
