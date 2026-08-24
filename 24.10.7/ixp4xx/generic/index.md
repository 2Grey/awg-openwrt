---
layout: default
title: "OpenWrt 24.10.7 ixp4xx/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.7](https://2grey.github.io/awg-openwrt/24.10.7/) / [ixp4xx](https://2grey.github.io/awg-openwrt/24.10.7/ixp4xx/)

- OpenWrt version: `24.10.7`
- Target: `ixp4xx`
- Subtarget: `generic`
- Package architecture: `armeb_xscale`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.7/targets/ixp4xx/generic/](https://downloads.openwrt.org/releases/24.10.7/targets/ixp4xx/generic/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.7/ixp4xx/generic" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.7/ixp4xx/generic/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.7/ixp4xx/generic/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.7/ixp4xx/generic/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.7/ixp4xx/generic/Packages.sig)
- [amneziawg-tools_v24.10.7_armeb_xscale_ixp4xx_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.7/ixp4xx/generic/amneziawg-tools_v24.10.7_armeb_xscale_ixp4xx_generic.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.7/ixp4xx/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.7/ixp4xx/generic/index.json)
- [kmod-amneziawg_v24.10.7_armeb_xscale_ixp4xx_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.7/ixp4xx/generic/kmod-amneziawg_v24.10.7_armeb_xscale_ixp4xx_generic.ipk)
- [luci-i18n-amneziawg-ru_v24.10.7_armeb_xscale_ixp4xx_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.7/ixp4xx/generic/luci-i18n-amneziawg-ru_v24.10.7_armeb_xscale_ixp4xx_generic.ipk)
- [luci-proto-amneziawg_v24.10.7_armeb_xscale_ixp4xx_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.7/ixp4xx/generic/luci-proto-amneziawg_v24.10.7_armeb_xscale_ixp4xx_generic.ipk)
