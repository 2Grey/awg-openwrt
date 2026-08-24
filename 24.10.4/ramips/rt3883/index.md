---
layout: default
title: "OpenWrt 24.10.4 ramips/rt3883"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.4](https://2grey.github.io/awg-openwrt/24.10.4/) / [ramips](https://2grey.github.io/awg-openwrt/24.10.4/ramips/)

- OpenWrt version: `24.10.4`
- Target: `ramips`
- Subtarget: `rt3883`
- Package architecture: `mipsel_74kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.4/targets/ramips/rt3883/](https://downloads.openwrt.org/releases/24.10.4/targets/ramips/rt3883/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.4/ramips/rt3883" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.4/ramips/rt3883/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.4/ramips/rt3883/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.4/ramips/rt3883/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.4/ramips/rt3883/Packages.sig)
- [amneziawg-tools_v24.10.4_mipsel_74kc_ramips_rt3883.ipk](https://2grey.github.io/awg-openwrt/24.10.4/ramips/rt3883/amneziawg-tools_v24.10.4_mipsel_74kc_ramips_rt3883.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.4/ramips/rt3883/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.4/ramips/rt3883/index.json)
- [kmod-amneziawg_v24.10.4_mipsel_74kc_ramips_rt3883.ipk](https://2grey.github.io/awg-openwrt/24.10.4/ramips/rt3883/kmod-amneziawg_v24.10.4_mipsel_74kc_ramips_rt3883.ipk)
- [luci-i18n-amneziawg-ru_v24.10.4_mipsel_74kc_ramips_rt3883.ipk](https://2grey.github.io/awg-openwrt/24.10.4/ramips/rt3883/luci-i18n-amneziawg-ru_v24.10.4_mipsel_74kc_ramips_rt3883.ipk)
- [luci-proto-amneziawg_v24.10.4_mipsel_74kc_ramips_rt3883.ipk](https://2grey.github.io/awg-openwrt/24.10.4/ramips/rt3883/luci-proto-amneziawg_v24.10.4_mipsel_74kc_ramips_rt3883.ipk)
