---
layout: default
title: "OpenWrt 25.12.1 bcm47xx/mips74k"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.1](https://2grey.github.io/awg-openwrt/25.12.1/) / [bcm47xx](https://2grey.github.io/awg-openwrt/25.12.1/bcm47xx/)

- OpenWrt version: `25.12.1`
- Target: `bcm47xx`
- Subtarget: `mips74k`
- Package architecture: `mipsel_74kc`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.1/targets/bcm47xx/mips74k/](https://downloads.openwrt.org/releases/25.12.1/targets/bcm47xx/mips74k/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.1/bcm47xx/mips74k/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/bcm47xx/mips74k/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools_v25.12.1_mipsel_74kc_bcm47xx_mips74k.apk](https://2grey.github.io/awg-openwrt/25.12.1/bcm47xx/mips74k/amneziawg-tools_v25.12.1_mipsel_74kc_bcm47xx_mips74k.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.1/bcm47xx/mips74k/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.1/bcm47xx/mips74k/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/bcm47xx/mips74k/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [kmod-amneziawg_v25.12.1_mipsel_74kc_bcm47xx_mips74k.apk](https://2grey.github.io/awg-openwrt/25.12.1/bcm47xx/mips74k/kmod-amneziawg_v25.12.1_mipsel_74kc_bcm47xx_mips74k.apk)
- [luci-i18n-amneziawg-ru-0.260808.37042.apk](https://2grey.github.io/awg-openwrt/25.12.1/bcm47xx/mips74k/luci-i18n-amneziawg-ru-0.260808.37042.apk)
- [luci-i18n-amneziawg-ru_v25.12.1_mipsel_74kc_bcm47xx_mips74k.apk](https://2grey.github.io/awg-openwrt/25.12.1/bcm47xx/mips74k/luci-i18n-amneziawg-ru_v25.12.1_mipsel_74kc_bcm47xx_mips74k.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.1/bcm47xx/mips74k/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg_v25.12.1_mipsel_74kc_bcm47xx_mips74k.apk](https://2grey.github.io/awg-openwrt/25.12.1/bcm47xx/mips74k/luci-proto-amneziawg_v25.12.1_mipsel_74kc_bcm47xx_mips74k.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.1/bcm47xx/mips74k/packages.adb)
