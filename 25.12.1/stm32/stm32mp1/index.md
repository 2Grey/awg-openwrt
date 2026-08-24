---
layout: default
title: "OpenWrt 25.12.1 stm32/stm32mp1"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.1](https://2grey.github.io/awg-openwrt/25.12.1/) / [stm32](https://2grey.github.io/awg-openwrt/25.12.1/stm32/)

- OpenWrt version: `25.12.1`
- Target: `stm32`
- Subtarget: `stm32mp1`
- Package architecture: `arm_cortex-a7_neon-vfpv4`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.1/targets/stm32/stm32mp1/](https://downloads.openwrt.org/releases/25.12.1/targets/stm32/stm32mp1/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.1_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.apk](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/amneziawg-tools_v25.12.1_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.74.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/kmod-amneziawg-6.12.74.3.1.20260812-r1.apk)
- [kmod-amneziawg_v25.12.1_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.apk](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/kmod-amneziawg_v25.12.1_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.apk)
- [luci-i18n-amneziawg-ru-0.260808.38235.apk](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/luci-i18n-amneziawg-ru-0.260808.38235.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.1_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.apk](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/luci-i18n-amneziawg-ru_v25.12.1_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg_v25.12.1_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.apk](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/luci-proto-amneziawg_v25.12.1_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.1/stm32/stm32mp1/packages.adb)
