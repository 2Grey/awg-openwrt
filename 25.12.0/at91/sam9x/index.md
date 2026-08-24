---
layout: default
title: "OpenWrt 25.12.0 at91/sam9x"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.0](https://2grey.github.io/awg-openwrt/25.12.0/) / [at91](https://2grey.github.io/awg-openwrt/25.12.0/at91/)

- OpenWrt version: `25.12.0`
- Target: `at91`
- Subtarget: `sam9x`
- Package architecture: `arm_arm926ej-s`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.0/targets/at91/sam9x/](https://downloads.openwrt.org/releases/25.12.0/targets/at91/sam9x/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.0/at91/sam9x/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/at91/sam9x/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools_v25.12.0_arm_arm926ej-s_at91_sam9x.apk](https://2grey.github.io/awg-openwrt/25.12.0/at91/sam9x/amneziawg-tools_v25.12.0_arm_arm926ej-s_at91_sam9x.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.0/at91/sam9x/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.0/at91/sam9x/index.json)
- [kmod-amneziawg-6.12.71.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/at91/sam9x/kmod-amneziawg-6.12.71.3.0.20260731-r1.apk)
- [kmod-amneziawg_v25.12.0_arm_arm926ej-s_at91_sam9x.apk](https://2grey.github.io/awg-openwrt/25.12.0/at91/sam9x/kmod-amneziawg_v25.12.0_arm_arm926ej-s_at91_sam9x.apk)
- [luci-i18n-amneziawg-ru-0.260808.49256.apk](https://2grey.github.io/awg-openwrt/25.12.0/at91/sam9x/luci-i18n-amneziawg-ru-0.260808.49256.apk)
- [luci-i18n-amneziawg-ru_v25.12.0_arm_arm926ej-s_at91_sam9x.apk](https://2grey.github.io/awg-openwrt/25.12.0/at91/sam9x/luci-i18n-amneziawg-ru_v25.12.0_arm_arm926ej-s_at91_sam9x.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.0/at91/sam9x/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg_v25.12.0_arm_arm926ej-s_at91_sam9x.apk](https://2grey.github.io/awg-openwrt/25.12.0/at91/sam9x/luci-proto-amneziawg_v25.12.0_arm_arm926ej-s_at91_sam9x.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.0/at91/sam9x/packages.adb)
