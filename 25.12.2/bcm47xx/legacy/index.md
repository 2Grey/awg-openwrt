---
layout: default
title: "OpenWrt 25.12.2 bcm47xx/legacy"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.2](https://2grey.github.io/awg-openwrt/25.12.2/) / [bcm47xx](https://2grey.github.io/awg-openwrt/25.12.2/bcm47xx/)

- OpenWrt version: `25.12.2`
- Target: `bcm47xx`
- Subtarget: `legacy`
- Package architecture: `mipsel_mips32`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.2/targets/bcm47xx/legacy/](https://downloads.openwrt.org/releases/25.12.2/targets/bcm47xx/legacy/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.2/bcm47xx/legacy/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/bcm47xx/legacy/amneziawg-tools-3.0.20260805-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.2/bcm47xx/legacy/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.2/bcm47xx/legacy/index.json)
- [kmod-amneziawg-6.12.74.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/bcm47xx/legacy/kmod-amneziawg-6.12.74.3.0.20260731-r1.apk)
- [luci-i18n-amneziawg-ru-0.260808.27656.apk](https://2grey.github.io/awg-openwrt/25.12.2/bcm47xx/legacy/luci-i18n-amneziawg-ru-0.260808.27656.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.2/bcm47xx/legacy/luci-proto-amneziawg-3.0.0-r1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.2/bcm47xx/legacy/packages.adb)
