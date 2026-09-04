---
layout: default
title: "OpenWrt 24.10.3 bmips/bcm6362"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.3](https://2grey.github.io/awg-openwrt/24.10.3/) / [bmips](https://2grey.github.io/awg-openwrt/24.10.3/bmips/)

- OpenWrt version: `24.10.3`
- Target: `bmips`
- Subtarget: `bcm6362`
- Package architecture: `mips_mips32`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.3/targets/bmips/bcm6362/](https://downloads.openwrt.org/releases/24.10.3/targets/bmips/bcm6362/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.3/bmips/bcm6362" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.3/bmips/bcm6362/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.3/bmips/bcm6362/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.3/bmips/bcm6362/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.3/bmips/bcm6362/Packages.sig)
- [amneziawg-tools_v24.10.3_mips_mips32_bmips_bcm6362.ipk](https://2grey.github.io/awg-openwrt/24.10.3/bmips/bcm6362/amneziawg-tools_v24.10.3_mips_mips32_bmips_bcm6362.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.3/bmips/bcm6362/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.3/bmips/bcm6362/index.json)
- [kmod-amneziawg_v24.10.3_mips_mips32_bmips_bcm6362.ipk](https://2grey.github.io/awg-openwrt/24.10.3/bmips/bcm6362/kmod-amneziawg_v24.10.3_mips_mips32_bmips_bcm6362.ipk)
- [luci-i18n-amneziawg-ru_v24.10.3_mips_mips32_bmips_bcm6362.ipk](https://2grey.github.io/awg-openwrt/24.10.3/bmips/bcm6362/luci-i18n-amneziawg-ru_v24.10.3_mips_mips32_bmips_bcm6362.ipk)
- [luci-proto-amneziawg_v24.10.3_mips_mips32_bmips_bcm6362.ipk](https://2grey.github.io/awg-openwrt/24.10.3/bmips/bcm6362/luci-proto-amneziawg_v24.10.3_mips_mips32_bmips_bcm6362.ipk)
