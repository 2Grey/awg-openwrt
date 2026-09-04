---
layout: default
title: "OpenWrt 24.10.2 bcm27xx/bcm2712"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.2](https://2grey.github.io/awg-openwrt/24.10.2/) / [bcm27xx](https://2grey.github.io/awg-openwrt/24.10.2/bcm27xx/)

- OpenWrt version: `24.10.2`
- Target: `bcm27xx`
- Subtarget: `bcm2712`
- Package architecture: `aarch64_cortex-a76`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.2/targets/bcm27xx/bcm2712/](https://downloads.openwrt.org/releases/24.10.2/targets/bcm27xx/bcm2712/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.2/bcm27xx/bcm2712" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.2/bcm27xx/bcm2712/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.2/bcm27xx/bcm2712/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.2/bcm27xx/bcm2712/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.2/bcm27xx/bcm2712/Packages.sig)
- [amneziawg-tools_v24.10.2_aarch64_cortex-a76_bcm27xx_bcm2712.ipk](https://2grey.github.io/awg-openwrt/24.10.2/bcm27xx/bcm2712/amneziawg-tools_v24.10.2_aarch64_cortex-a76_bcm27xx_bcm2712.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.2/bcm27xx/bcm2712/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.2/bcm27xx/bcm2712/index.json)
- [kmod-amneziawg_v24.10.2_aarch64_cortex-a76_bcm27xx_bcm2712.ipk](https://2grey.github.io/awg-openwrt/24.10.2/bcm27xx/bcm2712/kmod-amneziawg_v24.10.2_aarch64_cortex-a76_bcm27xx_bcm2712.ipk)
- [luci-i18n-amneziawg-ru_v24.10.2_aarch64_cortex-a76_bcm27xx_bcm2712.ipk](https://2grey.github.io/awg-openwrt/24.10.2/bcm27xx/bcm2712/luci-i18n-amneziawg-ru_v24.10.2_aarch64_cortex-a76_bcm27xx_bcm2712.ipk)
- [luci-proto-amneziawg_v24.10.2_aarch64_cortex-a76_bcm27xx_bcm2712.ipk](https://2grey.github.io/awg-openwrt/24.10.2/bcm27xx/bcm2712/luci-proto-amneziawg_v24.10.2_aarch64_cortex-a76_bcm27xx_bcm2712.ipk)
