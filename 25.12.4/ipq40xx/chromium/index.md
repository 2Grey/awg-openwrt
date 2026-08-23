---
layout: default
title: "OpenWrt 25.12.4 ipq40xx/chromium"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.4](https://2grey.github.io/awg-openwrt/25.12.4/) / [ipq40xx](https://2grey.github.io/awg-openwrt/25.12.4/ipq40xx/)

- OpenWrt version: `25.12.4`
- Target: `ipq40xx`
- Subtarget: `chromium`
- Package architecture: `arm_cortex-a7_neon-vfpv4`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.4/targets/ipq40xx/chromium/](https://downloads.openwrt.org/releases/25.12.4/targets/ipq40xx/chromium/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.4/ipq40xx/chromium/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/ipq40xx/chromium/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools_v25.12.4_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.apk](https://2grey.github.io/awg-openwrt/25.12.4/ipq40xx/chromium/amneziawg-tools_v25.12.4_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.4/ipq40xx/chromium/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.4/ipq40xx/chromium/index.json)
- [kmod-amneziawg-6.12.87.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/ipq40xx/chromium/kmod-amneziawg-6.12.87.3.0.20260731-r1.apk)
- [kmod-amneziawg_v25.12.4_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.apk](https://2grey.github.io/awg-openwrt/25.12.4/ipq40xx/chromium/kmod-amneziawg_v25.12.4_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.apk)
- [luci-i18n-amneziawg-ru-0.260807.38396.apk](https://2grey.github.io/awg-openwrt/25.12.4/ipq40xx/chromium/luci-i18n-amneziawg-ru-0.260807.38396.apk)
- [luci-i18n-amneziawg-ru_v25.12.4_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.apk](https://2grey.github.io/awg-openwrt/25.12.4/ipq40xx/chromium/luci-i18n-amneziawg-ru_v25.12.4_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/ipq40xx/chromium/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg_v25.12.4_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.apk](https://2grey.github.io/awg-openwrt/25.12.4/ipq40xx/chromium/luci-proto-amneziawg_v25.12.4_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.4/ipq40xx/chromium/packages.adb)
