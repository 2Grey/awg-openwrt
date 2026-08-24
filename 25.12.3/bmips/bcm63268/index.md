---
layout: default
title: "OpenWrt 25.12.3 bmips/bcm63268"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.3](https://2grey.github.io/awg-openwrt/25.12.3/) / [bmips](https://2grey.github.io/awg-openwrt/25.12.3/bmips/)

- OpenWrt version: `25.12.3`
- Target: `bmips`
- Subtarget: `bcm63268`
- Package architecture: `mips_mips32`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.3/targets/bmips/bcm63268/](https://downloads.openwrt.org/releases/25.12.3/targets/bmips/bcm63268/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools-3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/amneziawg-tools-3.1.20260812-r1.apk)
- [amneziawg-tools_v25.12.3_mips_mips32_bmips_bcm63268.apk](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/amneziawg-tools_v25.12.3_mips_mips32_bmips_bcm63268.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/index.json)
- [kmod-amneziawg-6.12.85.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/kmod-amneziawg-6.12.85.3.0.20260731-r1.apk)
- [kmod-amneziawg-6.12.85.3.1.20260812-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/kmod-amneziawg-6.12.85.3.1.20260812-r1.apk)
- [kmod-amneziawg_v25.12.3_mips_mips32_bmips_bcm63268.apk](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/kmod-amneziawg_v25.12.3_mips_mips32_bmips_bcm63268.apk)
- [luci-i18n-amneziawg-ru-0.260808.21413.apk](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/luci-i18n-amneziawg-ru-0.260808.21413.apk)
- [luci-i18n-amneziawg-ru-0.apk](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/luci-i18n-amneziawg-ru-0.apk)
- [luci-i18n-amneziawg-ru_v25.12.3_mips_mips32_bmips_bcm63268.apk](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/luci-i18n-amneziawg-ru_v25.12.3_mips_mips32_bmips_bcm63268.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg-3.1.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/luci-proto-amneziawg-3.1.0-r1.apk)
- [luci-proto-amneziawg_v25.12.3_mips_mips32_bmips_bcm63268.apk](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/luci-proto-amneziawg_v25.12.3_mips_mips32_bmips_bcm63268.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.3/bmips/bcm63268/packages.adb)
