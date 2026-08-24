---
layout: default
title: "OpenWrt 24.10.6 bmips/bcm6318"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.6](https://2grey.github.io/awg-openwrt/24.10.6/) / [bmips](https://2grey.github.io/awg-openwrt/24.10.6/bmips/)

- OpenWrt version: `24.10.6`
- Target: `bmips`
- Subtarget: `bcm6318`
- Package architecture: `mips_mips32`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.6/targets/bmips/bcm6318/](https://downloads.openwrt.org/releases/24.10.6/targets/bmips/bcm6318/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.6/bmips/bcm6318" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.6/bmips/bcm6318/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.6/bmips/bcm6318/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.6/bmips/bcm6318/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.6/bmips/bcm6318/Packages.sig)
- [amneziawg-tools_v24.10.6_mips_mips32_bmips_bcm6318.ipk](https://2grey.github.io/awg-openwrt/24.10.6/bmips/bcm6318/amneziawg-tools_v24.10.6_mips_mips32_bmips_bcm6318.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.6/bmips/bcm6318/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.6/bmips/bcm6318/index.json)
- [kmod-amneziawg_v24.10.6_mips_mips32_bmips_bcm6318.ipk](https://2grey.github.io/awg-openwrt/24.10.6/bmips/bcm6318/kmod-amneziawg_v24.10.6_mips_mips32_bmips_bcm6318.ipk)
- [luci-i18n-amneziawg-ru_v24.10.6_mips_mips32_bmips_bcm6318.ipk](https://2grey.github.io/awg-openwrt/24.10.6/bmips/bcm6318/luci-i18n-amneziawg-ru_v24.10.6_mips_mips32_bmips_bcm6318.ipk)
- [luci-proto-amneziawg_v24.10.6_mips_mips32_bmips_bcm6318.ipk](https://2grey.github.io/awg-openwrt/24.10.6/bmips/bcm6318/luci-proto-amneziawg_v24.10.6_mips_mips32_bmips_bcm6318.ipk)
