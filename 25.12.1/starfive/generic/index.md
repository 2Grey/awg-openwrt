---
layout: default
title: "OpenWrt 25.12.1 starfive/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.1](https://2grey.github.io/awg-openwrt/25.12.1/) / [starfive](https://2grey.github.io/awg-openwrt/25.12.1/starfive/)

- OpenWrt version: `25.12.1`
- Target: `starfive`
- Subtarget: `generic`
- Package architecture: `riscv64_generic`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.1/targets/starfive/generic/](https://downloads.openwrt.org/releases/25.12.1/targets/starfive/generic/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.1/starfive/generic/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/starfive/generic/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools_v25.12.1_riscv64_generic_starfive_generic.apk](https://2grey.github.io/awg-openwrt/25.12.1/starfive/generic/amneziawg-tools_v25.12.1_riscv64_generic_starfive_generic.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.1/starfive/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.1/starfive/generic/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/starfive/generic/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [kmod-amneziawg_v25.12.1_riscv64_generic_starfive_generic.apk](https://2grey.github.io/awg-openwrt/25.12.1/starfive/generic/kmod-amneziawg_v25.12.1_riscv64_generic_starfive_generic.apk)
- [luci-i18n-amneziawg-ru-0.260808.40218.apk](https://2grey.github.io/awg-openwrt/25.12.1/starfive/generic/luci-i18n-amneziawg-ru-0.260808.40218.apk)
- [luci-i18n-amneziawg-ru_v25.12.1_riscv64_generic_starfive_generic.apk](https://2grey.github.io/awg-openwrt/25.12.1/starfive/generic/luci-i18n-amneziawg-ru_v25.12.1_riscv64_generic_starfive_generic.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/starfive/generic/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg_v25.12.1_riscv64_generic_starfive_generic.apk](https://2grey.github.io/awg-openwrt/25.12.1/starfive/generic/luci-proto-amneziawg_v25.12.1_riscv64_generic_starfive_generic.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.1/starfive/generic/packages.adb)
