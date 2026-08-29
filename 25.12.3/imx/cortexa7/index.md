---
layout: default
title: "OpenWrt 25.12.3 imx/cortexa7"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.3](https://2grey.github.io/awg-openwrt/25.12.3/) / [imx](https://2grey.github.io/awg-openwrt/25.12.3/imx/)

- OpenWrt version: `25.12.3`
- Target: `imx`
- Subtarget: `cortexa7`
- Package architecture: `arm_cortex-a7_neon-vfpv4`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.3/targets/imx/cortexa7/](https://downloads.openwrt.org/releases/25.12.3/targets/imx/cortexa7/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.3_arm_cortex-a7_neon-vfpv4_imx_cortexa7.apk](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/amneziawg-tools_v25.12.3_arm_cortex-a7_neon-vfpv4_imx_cortexa7.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/index.json)
- [kmod-amneziawg-6.12.85.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/kmod-amneziawg-6.12.85.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.85.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/kmod-amneziawg-6.12.85.3.1.20260812-r1.apk)
- [kmod-amneziawg-6.12.85.3.1.20260828-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/kmod-amneziawg-6.12.85.3.1.20260828-r1.apk)
- [kmod-amneziawg_v25.12.3_arm_cortex-a7_neon-vfpv4_imx_cortexa7.apk](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/kmod-amneziawg_v25.12.3_arm_cortex-a7_neon-vfpv4_imx_cortexa7.apk)
- [luci-i18n-amneziawg-ru-0.260808.22009.apk](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/luci-i18n-amneziawg-ru-0.260808.22009.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.3_arm_cortex-a7_neon-vfpv4_imx_cortexa7.apk](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/luci-i18n-amneziawg-ru_v25.12.3_arm_cortex-a7_neon-vfpv4_imx_cortexa7.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg_v25.12.3_arm_cortex-a7_neon-vfpv4_imx_cortexa7.apk](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/luci-proto-amneziawg_v25.12.3_arm_cortex-a7_neon-vfpv4_imx_cortexa7.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.3/imx/cortexa7/packages.adb)
