---
layout: default
title: "OpenWrt 25.12.5 malta/be"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.5](https://2grey.github.io/awg-openwrt/25.12.5/) / [malta](https://2grey.github.io/awg-openwrt/25.12.5/malta/)

- OpenWrt version: `25.12.5`
- Target: `malta`
- Subtarget: `be`
- Package architecture: `mips_24kc`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.5/targets/malta/be/](https://downloads.openwrt.org/releases/25.12.5/targets/malta/be/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.5/malta/be/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools_v25.12.5_mips_24kc_malta_be.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be/amneziawg-tools_v25.12.5_mips_24kc_malta_be.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.5/malta/be/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.5/malta/be/index.json)
- [kmod-amneziawg-6.12.94.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be/kmod-amneziawg-6.12.94.3.0.20260731-r1.apk)
- [kmod-amneziawg_v25.12.5_mips_24kc_malta_be.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be/kmod-amneziawg_v25.12.5_mips_24kc_malta_be.apk)
- [luci-i18n-amneziawg-ru-0.260807.69019.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be/luci-i18n-amneziawg-ru-0.260807.69019.apk)
- [luci-i18n-amneziawg-ru_v25.12.5_mips_24kc_malta_be.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be/luci-i18n-amneziawg-ru_v25.12.5_mips_24kc_malta_be.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg_v25.12.5_mips_24kc_malta_be.apk](https://2grey.github.io/awg-openwrt/25.12.5/malta/be/luci-proto-amneziawg_v25.12.5_mips_24kc_malta_be.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.5/malta/be/packages.adb)
