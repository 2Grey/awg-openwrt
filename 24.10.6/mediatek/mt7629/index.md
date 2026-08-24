---
layout: default
title: "OpenWrt 24.10.6 mediatek/mt7629"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.6](https://2grey.github.io/awg-openwrt/24.10.6/) / [mediatek](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/)

- OpenWrt version: `24.10.6`
- Target: `mediatek`
- Subtarget: `mt7629`
- Package architecture: `arm_cortex-a7`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.6/targets/mediatek/mt7629/](https://downloads.openwrt.org/releases/24.10.6/targets/mediatek/mt7629/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7629" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7629/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7629/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7629/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7629/Packages.sig)
- [amneziawg-tools_v24.10.6_arm_cortex-a7_mediatek_mt7629.ipk](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7629/amneziawg-tools_v24.10.6_arm_cortex-a7_mediatek_mt7629.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7629/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7629/index.json)
- [kmod-amneziawg_v24.10.6_arm_cortex-a7_mediatek_mt7629.ipk](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7629/kmod-amneziawg_v24.10.6_arm_cortex-a7_mediatek_mt7629.ipk)
- [luci-i18n-amneziawg-ru_v24.10.6_arm_cortex-a7_mediatek_mt7629.ipk](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7629/luci-i18n-amneziawg-ru_v24.10.6_arm_cortex-a7_mediatek_mt7629.ipk)
- [luci-proto-amneziawg_v24.10.6_arm_cortex-a7_mediatek_mt7629.ipk](https://2grey.github.io/awg-openwrt/24.10.6/mediatek/mt7629/luci-proto-amneziawg_v24.10.6_arm_cortex-a7_mediatek_mt7629.ipk)
