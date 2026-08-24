---
layout: default
title: "OpenWrt 24.10.8 mediatek/filogic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.8](https://2grey.github.io/awg-openwrt/24.10.8/) / [mediatek](https://2grey.github.io/awg-openwrt/24.10.8/mediatek/)

- OpenWrt version: `24.10.8`
- Target: `mediatek`
- Subtarget: `filogic`
- Package architecture: `aarch64_cortex-a53`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.8/targets/mediatek/filogic/](https://downloads.openwrt.org/releases/24.10.8/targets/mediatek/filogic/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.8/mediatek/filogic" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.8/mediatek/filogic/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.8/mediatek/filogic/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.8/mediatek/filogic/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.8/mediatek/filogic/Packages.sig)
- [amneziawg-tools_v24.10.8_aarch64_cortex-a53_mediatek_filogic.ipk](https://2grey.github.io/awg-openwrt/24.10.8/mediatek/filogic/amneziawg-tools_v24.10.8_aarch64_cortex-a53_mediatek_filogic.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.8/mediatek/filogic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.8/mediatek/filogic/index.json)
- [kmod-amneziawg_v24.10.8_aarch64_cortex-a53_mediatek_filogic.ipk](https://2grey.github.io/awg-openwrt/24.10.8/mediatek/filogic/kmod-amneziawg_v24.10.8_aarch64_cortex-a53_mediatek_filogic.ipk)
- [luci-i18n-amneziawg-ru_v24.10.8_aarch64_cortex-a53_mediatek_filogic.ipk](https://2grey.github.io/awg-openwrt/24.10.8/mediatek/filogic/luci-i18n-amneziawg-ru_v24.10.8_aarch64_cortex-a53_mediatek_filogic.ipk)
- [luci-proto-amneziawg_v24.10.8_aarch64_cortex-a53_mediatek_filogic.ipk](https://2grey.github.io/awg-openwrt/24.10.8/mediatek/filogic/luci-proto-amneziawg_v24.10.8_aarch64_cortex-a53_mediatek_filogic.ipk)
