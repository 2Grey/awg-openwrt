---
layout: default
title: "OpenWrt 24.10.5 bcm27xx/bcm2708"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.5](https://2grey.github.io/awg-openwrt/24.10.5/) / [bcm27xx](https://2grey.github.io/awg-openwrt/24.10.5/bcm27xx/)

- OpenWrt version: `24.10.5`
- Target: `bcm27xx`
- Subtarget: `bcm2708`
- Package architecture: `arm_arm1176jzf-s_vfp`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.5/targets/bcm27xx/bcm2708/](https://downloads.openwrt.org/releases/24.10.5/targets/bcm27xx/bcm2708/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.5/bcm27xx/bcm2708" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.5/bcm27xx/bcm2708/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.5/bcm27xx/bcm2708/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.5/bcm27xx/bcm2708/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.5/bcm27xx/bcm2708/Packages.sig)
- [amneziawg-tools_v24.10.5_arm_arm1176jzf-s_vfp_bcm27xx_bcm2708.ipk](https://2grey.github.io/awg-openwrt/24.10.5/bcm27xx/bcm2708/amneziawg-tools_v24.10.5_arm_arm1176jzf-s_vfp_bcm27xx_bcm2708.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.5/bcm27xx/bcm2708/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.5/bcm27xx/bcm2708/index.json)
- [kmod-amneziawg_v24.10.5_arm_arm1176jzf-s_vfp_bcm27xx_bcm2708.ipk](https://2grey.github.io/awg-openwrt/24.10.5/bcm27xx/bcm2708/kmod-amneziawg_v24.10.5_arm_arm1176jzf-s_vfp_bcm27xx_bcm2708.ipk)
- [luci-i18n-amneziawg-ru_v24.10.5_arm_arm1176jzf-s_vfp_bcm27xx_bcm2708.ipk](https://2grey.github.io/awg-openwrt/24.10.5/bcm27xx/bcm2708/luci-i18n-amneziawg-ru_v24.10.5_arm_arm1176jzf-s_vfp_bcm27xx_bcm2708.ipk)
- [luci-proto-amneziawg_v24.10.5_arm_arm1176jzf-s_vfp_bcm27xx_bcm2708.ipk](https://2grey.github.io/awg-openwrt/24.10.5/bcm27xx/bcm2708/luci-proto-amneziawg_v24.10.5_arm_arm1176jzf-s_vfp_bcm27xx_bcm2708.ipk)
