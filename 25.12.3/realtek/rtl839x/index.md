---
layout: default
title: "OpenWrt 25.12.3 realtek/rtl839x"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.3](https://2grey.github.io/awg-openwrt/25.12.3/) / [realtek](https://2grey.github.io/awg-openwrt/25.12.3/realtek/)

- OpenWrt version: `25.12.3`
- Target: `realtek`
- Subtarget: `rtl839x`
- Package architecture: `mips_24kc`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.3/targets/realtek/rtl839x/](https://downloads.openwrt.org/releases/25.12.3/targets/realtek/rtl839x/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.3_mips_24kc_realtek_rtl839x.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/amneziawg-tools_v25.12.3_mips_24kc_realtek_rtl839x.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/index.json)
- [kmod-amneziawg-6.12.85.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/kmod-amneziawg-6.12.85.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.85.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/kmod-amneziawg-6.12.85.3.1.20260812-r1.apk)
- [kmod-amneziawg-6.12.85.3.1.20260828-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/kmod-amneziawg-6.12.85.3.1.20260828-r1.apk)
- [kmod-amneziawg_v25.12.3_mips_24kc_realtek_rtl839x.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/kmod-amneziawg_v25.12.3_mips_24kc_realtek_rtl839x.apk)
- [luci-i18n-amneziawg-ru-0.260808.24057.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/luci-i18n-amneziawg-ru-0.260808.24057.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.3_mips_24kc_realtek_rtl839x.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/luci-i18n-amneziawg-ru_v25.12.3_mips_24kc_realtek_rtl839x.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg-3.1.1-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/luci-proto-amneziawg-3.1.1-r1.apk)
- [luci-proto-amneziawg_v25.12.3_mips_24kc_realtek_rtl839x.apk](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/luci-proto-amneziawg_v25.12.3_mips_24kc_realtek_rtl839x.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.3/realtek/rtl839x/packages.adb)
