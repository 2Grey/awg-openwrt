---
layout: default
title: "OpenWrt 25.12.0 ipq806x/chromium"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.0](https://2grey.github.io/awg-openwrt/25.12.0/) / [ipq806x](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/)

- OpenWrt version: `25.12.0`
- Target: `ipq806x`
- Subtarget: `chromium`
- Package architecture: `arm_cortex-a15_neon-vfpv4`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.0/targets/ipq806x/chromium/](https://downloads.openwrt.org/releases/25.12.0/targets/ipq806x/chromium/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.0_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.apk](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/amneziawg-tools_v25.12.0_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/index.json)
- [kmod-amneziawg-6.12.71.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/kmod-amneziawg-6.12.71.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.71.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/kmod-amneziawg-6.12.71.3.1.20260812-r1.apk)
- [kmod-amneziawg_v25.12.0_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.apk](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/kmod-amneziawg_v25.12.0_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.apk)
- [luci-i18n-amneziawg-ru-0.260808.40988.apk](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/luci-i18n-amneziawg-ru-0.260808.40988.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.0_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.apk](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/luci-i18n-amneziawg-ru_v25.12.0_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg_v25.12.0_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.apk](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/luci-proto-amneziawg_v25.12.0_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.0/ipq806x/chromium/packages.adb)
