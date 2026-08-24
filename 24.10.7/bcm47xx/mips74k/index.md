---
layout: default
title: "OpenWrt 24.10.7 bcm47xx/mips74k"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.7](https://2grey.github.io/awg-openwrt/24.10.7/) / [bcm47xx](https://2grey.github.io/awg-openwrt/24.10.7/bcm47xx/)

- OpenWrt version: `24.10.7`
- Target: `bcm47xx`
- Subtarget: `mips74k`
- Package architecture: `mipsel_74kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.7/targets/bcm47xx/mips74k/](https://downloads.openwrt.org/releases/24.10.7/targets/bcm47xx/mips74k/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.7/bcm47xx/mips74k" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.7/bcm47xx/mips74k/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.7/bcm47xx/mips74k/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.7/bcm47xx/mips74k/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.7/bcm47xx/mips74k/Packages.sig)
- [amneziawg-tools_v24.10.7_mipsel_74kc_bcm47xx_mips74k.ipk](https://2grey.github.io/awg-openwrt/24.10.7/bcm47xx/mips74k/amneziawg-tools_v24.10.7_mipsel_74kc_bcm47xx_mips74k.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.7/bcm47xx/mips74k/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.7/bcm47xx/mips74k/index.json)
- [kmod-amneziawg_v24.10.7_mipsel_74kc_bcm47xx_mips74k.ipk](https://2grey.github.io/awg-openwrt/24.10.7/bcm47xx/mips74k/kmod-amneziawg_v24.10.7_mipsel_74kc_bcm47xx_mips74k.ipk)
- [luci-i18n-amneziawg-ru_v24.10.7_mipsel_74kc_bcm47xx_mips74k.ipk](https://2grey.github.io/awg-openwrt/24.10.7/bcm47xx/mips74k/luci-i18n-amneziawg-ru_v24.10.7_mipsel_74kc_bcm47xx_mips74k.ipk)
- [luci-proto-amneziawg_v24.10.7_mipsel_74kc_bcm47xx_mips74k.ipk](https://2grey.github.io/awg-openwrt/24.10.7/bcm47xx/mips74k/luci-proto-amneziawg_v24.10.7_mipsel_74kc_bcm47xx_mips74k.ipk)
