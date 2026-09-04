---
layout: default
title: "OpenWrt 24.10.2 mediatek/mt7622"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.2](https://2grey.github.io/awg-openwrt/24.10.2/) / [mediatek](https://2grey.github.io/awg-openwrt/24.10.2/mediatek/)

- OpenWrt version: `24.10.2`
- Target: `mediatek`
- Subtarget: `mt7622`
- Package architecture: `aarch64_cortex-a53`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.2/targets/mediatek/mt7622/](https://downloads.openwrt.org/releases/24.10.2/targets/mediatek/mt7622/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.2/mediatek/mt7622" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.2/mediatek/mt7622/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.2/mediatek/mt7622/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.2/mediatek/mt7622/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.2/mediatek/mt7622/Packages.sig)
- [amneziawg-tools_v24.10.2_aarch64_cortex-a53_mediatek_mt7622.ipk](https://2grey.github.io/awg-openwrt/24.10.2/mediatek/mt7622/amneziawg-tools_v24.10.2_aarch64_cortex-a53_mediatek_mt7622.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.2/mediatek/mt7622/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.2/mediatek/mt7622/index.json)
- [kmod-amneziawg_v24.10.2_aarch64_cortex-a53_mediatek_mt7622.ipk](https://2grey.github.io/awg-openwrt/24.10.2/mediatek/mt7622/kmod-amneziawg_v24.10.2_aarch64_cortex-a53_mediatek_mt7622.ipk)
- [luci-i18n-amneziawg-ru_v24.10.2_aarch64_cortex-a53_mediatek_mt7622.ipk](https://2grey.github.io/awg-openwrt/24.10.2/mediatek/mt7622/luci-i18n-amneziawg-ru_v24.10.2_aarch64_cortex-a53_mediatek_mt7622.ipk)
- [luci-proto-amneziawg_v24.10.2_aarch64_cortex-a53_mediatek_mt7622.ipk](https://2grey.github.io/awg-openwrt/24.10.2/mediatek/mt7622/luci-proto-amneziawg_v24.10.2_aarch64_cortex-a53_mediatek_mt7622.ipk)
