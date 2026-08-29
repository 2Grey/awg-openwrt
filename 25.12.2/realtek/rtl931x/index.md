---
layout: default
title: "OpenWrt 25.12.2 realtek/rtl931x"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.2](https://2grey.github.io/awg-openwrt/25.12.2/) / [realtek](https://2grey.github.io/awg-openwrt/25.12.2/realtek/)

- OpenWrt version: `25.12.2`
- Target: `realtek`
- Subtarget: `rtl931x`
- Package architecture: `mips_24kc`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.2/targets/realtek/rtl931x/](https://downloads.openwrt.org/releases/25.12.2/targets/realtek/rtl931x/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.2_mips_24kc_realtek_rtl931x.apk](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/amneziawg-tools_v25.12.2_mips_24kc_realtek_rtl931x.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.74.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/kmod-amneziawg-6.12.74.3.1.20260812-r1.apk)
- [kmod-amneziawg-6.12.74.3.1.20260828-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/kmod-amneziawg-6.12.74.3.1.20260828-r1.apk)
- [kmod-amneziawg_v25.12.2_mips_24kc_realtek_rtl931x.apk](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/kmod-amneziawg_v25.12.2_mips_24kc_realtek_rtl931x.apk)
- [luci-i18n-amneziawg-ru-0.260808.29007.apk](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/luci-i18n-amneziawg-ru-0.260808.29007.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.2_mips_24kc_realtek_rtl931x.apk](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/luci-i18n-amneziawg-ru_v25.12.2_mips_24kc_realtek_rtl931x.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg_v25.12.2_mips_24kc_realtek_rtl931x.apk](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/luci-proto-amneziawg_v25.12.2_mips_24kc_realtek_rtl931x.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.2/realtek/rtl931x/packages.adb)
