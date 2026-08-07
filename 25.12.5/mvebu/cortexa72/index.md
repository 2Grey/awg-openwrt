---
layout: default
title: "OpenWrt 25.12.5 mvebu/cortexa72"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.5](https://2grey.github.io/awg-openwrt/25.12.5/) / [mvebu](https://2grey.github.io/awg-openwrt/25.12.5/mvebu/)

- OpenWrt version: `25.12.5`
- Target: `mvebu`
- Subtarget: `cortexa72`
- Package architecture: `aarch64_cortex-a72`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.5/targets/mvebu/cortexa72/](https://downloads.openwrt.org/releases/25.12.5/targets/mvebu/cortexa72/)

## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.5/mvebu/cortexa72/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/mvebu/cortexa72/amneziawg-tools-3.0.20260805-r1.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.5/mvebu/cortexa72/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.5/mvebu/cortexa72/index.json)
- [kmod-amneziawg-6.12.94.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/mvebu/cortexa72/kmod-amneziawg-6.12.94.3.0.20260731-r1.apk)
- [luci-i18n-amneziawg-ru-0.260807.69280.apk](https://2grey.github.io/awg-openwrt/25.12.5/mvebu/cortexa72/luci-i18n-amneziawg-ru-0.260807.69280.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/mvebu/cortexa72/luci-proto-amneziawg-3.0.0-r1.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.5/mvebu/cortexa72/packages.adb)
