---
layout: default
title: "OpenWrt 24.10.8 ramips/mt76x8"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.8](https://2grey.github.io/awg-openwrt/24.10.8/) / [ramips](https://2grey.github.io/awg-openwrt/24.10.8/ramips/)

- OpenWrt version: `24.10.8`
- Target: `ramips`
- Subtarget: `mt76x8`
- Package architecture: `mipsel_24kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.8/targets/ramips/mt76x8/](https://downloads.openwrt.org/releases/24.10.8/targets/ramips/mt76x8/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.8/ramips/mt76x8" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.8/ramips/mt76x8/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.8/ramips/mt76x8/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.8/ramips/mt76x8/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.8/ramips/mt76x8/Packages.sig)
- [amneziawg-tools_v24.10.8_mipsel_24kc_ramips_mt76x8.ipk](https://2grey.github.io/awg-openwrt/24.10.8/ramips/mt76x8/amneziawg-tools_v24.10.8_mipsel_24kc_ramips_mt76x8.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.8/ramips/mt76x8/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.8/ramips/mt76x8/index.json)
- [kmod-amneziawg_v24.10.8_mipsel_24kc_ramips_mt76x8.ipk](https://2grey.github.io/awg-openwrt/24.10.8/ramips/mt76x8/kmod-amneziawg_v24.10.8_mipsel_24kc_ramips_mt76x8.ipk)
- [luci-i18n-amneziawg-ru_v24.10.8_mipsel_24kc_ramips_mt76x8.ipk](https://2grey.github.io/awg-openwrt/24.10.8/ramips/mt76x8/luci-i18n-amneziawg-ru_v24.10.8_mipsel_24kc_ramips_mt76x8.ipk)
- [luci-proto-amneziawg_v24.10.8_mipsel_24kc_ramips_mt76x8.ipk](https://2grey.github.io/awg-openwrt/24.10.8/ramips/mt76x8/luci-proto-amneziawg_v24.10.8_mipsel_24kc_ramips_mt76x8.ipk)
