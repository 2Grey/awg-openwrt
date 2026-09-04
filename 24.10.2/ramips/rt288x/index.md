---
layout: default
title: "OpenWrt 24.10.2 ramips/rt288x"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.2](https://2grey.github.io/awg-openwrt/24.10.2/) / [ramips](https://2grey.github.io/awg-openwrt/24.10.2/ramips/)

- OpenWrt version: `24.10.2`
- Target: `ramips`
- Subtarget: `rt288x`
- Package architecture: `mipsel_24kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.2/targets/ramips/rt288x/](https://downloads.openwrt.org/releases/24.10.2/targets/ramips/rt288x/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.2/ramips/rt288x" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.2/ramips/rt288x/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.2/ramips/rt288x/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.2/ramips/rt288x/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.2/ramips/rt288x/Packages.sig)
- [amneziawg-tools_v24.10.2_mipsel_24kc_ramips_rt288x.ipk](https://2grey.github.io/awg-openwrt/24.10.2/ramips/rt288x/amneziawg-tools_v24.10.2_mipsel_24kc_ramips_rt288x.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.2/ramips/rt288x/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.2/ramips/rt288x/index.json)
- [kmod-amneziawg_v24.10.2_mipsel_24kc_ramips_rt288x.ipk](https://2grey.github.io/awg-openwrt/24.10.2/ramips/rt288x/kmod-amneziawg_v24.10.2_mipsel_24kc_ramips_rt288x.ipk)
- [luci-i18n-amneziawg-ru_v24.10.2_mipsel_24kc_ramips_rt288x.ipk](https://2grey.github.io/awg-openwrt/24.10.2/ramips/rt288x/luci-i18n-amneziawg-ru_v24.10.2_mipsel_24kc_ramips_rt288x.ipk)
- [luci-proto-amneziawg_v24.10.2_mipsel_24kc_ramips_rt288x.ipk](https://2grey.github.io/awg-openwrt/24.10.2/ramips/rt288x/luci-proto-amneziawg_v24.10.2_mipsel_24kc_ramips_rt288x.ipk)
