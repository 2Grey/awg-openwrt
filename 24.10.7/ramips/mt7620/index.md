---
layout: default
title: "OpenWrt 24.10.7 ramips/mt7620"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.7](https://2grey.github.io/awg-openwrt/24.10.7/) / [ramips](https://2grey.github.io/awg-openwrt/24.10.7/ramips/)

- OpenWrt version: `24.10.7`
- Target: `ramips`
- Subtarget: `mt7620`
- Package architecture: `mipsel_24kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.7/targets/ramips/mt7620/](https://downloads.openwrt.org/releases/24.10.7/targets/ramips/mt7620/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.7/ramips/mt7620" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.7/ramips/mt7620/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.7/ramips/mt7620/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.7/ramips/mt7620/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.7/ramips/mt7620/Packages.sig)
- [amneziawg-tools_v24.10.7_mipsel_24kc_ramips_mt7620.ipk](https://2grey.github.io/awg-openwrt/24.10.7/ramips/mt7620/amneziawg-tools_v24.10.7_mipsel_24kc_ramips_mt7620.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.7/ramips/mt7620/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.7/ramips/mt7620/index.json)
- [kmod-amneziawg_v24.10.7_mipsel_24kc_ramips_mt7620.ipk](https://2grey.github.io/awg-openwrt/24.10.7/ramips/mt7620/kmod-amneziawg_v24.10.7_mipsel_24kc_ramips_mt7620.ipk)
- [luci-i18n-amneziawg-ru_v24.10.7_mipsel_24kc_ramips_mt7620.ipk](https://2grey.github.io/awg-openwrt/24.10.7/ramips/mt7620/luci-i18n-amneziawg-ru_v24.10.7_mipsel_24kc_ramips_mt7620.ipk)
- [luci-proto-amneziawg_v24.10.7_mipsel_24kc_ramips_mt7620.ipk](https://2grey.github.io/awg-openwrt/24.10.7/ramips/mt7620/luci-proto-amneziawg_v24.10.7_mipsel_24kc_ramips_mt7620.ipk)
