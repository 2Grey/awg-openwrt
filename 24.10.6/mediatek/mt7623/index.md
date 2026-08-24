---
layout: default
title: "OpenWrt 24.10.6 mediatek/mt7623"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.6](https://2grey.github.io/awg-openwrt/24.10.6/) / [mediatek](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/)

- OpenWrt version: `24.10.6`
- Target: `mediatek`
- Subtarget: `mt7623`
- Package architecture: `arm_cortex-a7_neon-vfpv4`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.6/targets/mediatek/mt7623/](https://downloads.openwrt.org/releases/24.10.6/targets/mediatek/mt7623/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7623" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7623/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7623/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7623/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7623/Packages.sig)
- [amneziawg-tools_v24.10.6_arm_cortex-a7_neon-vfpv4_mediatek_mt7623.ipk](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7623/amneziawg-tools_v24.10.6_arm_cortex-a7_neon-vfpv4_mediatek_mt7623.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7623/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7623/index.json)
- [kmod-amneziawg_v24.10.6_arm_cortex-a7_neon-vfpv4_mediatek_mt7623.ipk](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7623/kmod-amneziawg_v24.10.6_arm_cortex-a7_neon-vfpv4_mediatek_mt7623.ipk)
- [luci-i18n-amneziawg-ru_v24.10.6_arm_cortex-a7_neon-vfpv4_mediatek_mt7623.ipk](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7623/luci-i18n-amneziawg-ru_v24.10.6_arm_cortex-a7_neon-vfpv4_mediatek_mt7623.ipk)
- [luci-proto-amneziawg_v24.10.6_arm_cortex-a7_neon-vfpv4_mediatek_mt7623.ipk](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7623/luci-proto-amneziawg_v24.10.6_arm_cortex-a7_neon-vfpv4_mediatek_mt7623.ipk)
