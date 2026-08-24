---
layout: default
title: "OpenWrt 25.12.2 zynq/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.2](https://2grey.github.io/awg-openwrt/25.12.2/) / [zynq](https://2grey.github.io/awg-openwrt/25.12.2/zynq/)

- OpenWrt version: `25.12.2`
- Target: `zynq`
- Subtarget: `generic`
- Package architecture: `arm_cortex-a9_neon`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.2/targets/zynq/generic/](https://downloads.openwrt.org/releases/25.12.2/targets/zynq/generic/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.2_arm_cortex-a9_neon_zynq_generic.apk](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/amneziawg-tools_v25.12.2_arm_cortex-a9_neon_zynq_generic.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.74.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/kmod-amneziawg-6.12.74.3.1.20260812-r1.apk)
- [kmod-amneziawg_v25.12.2_arm_cortex-a9_neon_zynq_generic.apk](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/kmod-amneziawg_v25.12.2_arm_cortex-a9_neon_zynq_generic.apk)
- [luci-i18n-amneziawg-ru-0.260808.29706.apk](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/luci-i18n-amneziawg-ru-0.260808.29706.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.2_arm_cortex-a9_neon_zynq_generic.apk](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/luci-i18n-amneziawg-ru_v25.12.2_arm_cortex-a9_neon_zynq_generic.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg_v25.12.2_arm_cortex-a9_neon_zynq_generic.apk](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/luci-proto-amneziawg_v25.12.2_arm_cortex-a9_neon_zynq_generic.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.2/zynq/generic/packages.adb)
