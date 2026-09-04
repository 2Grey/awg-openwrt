---
layout: default
title: "OpenWrt 24.10.3 sunxi/cortexa8"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.3](https://2grey.github.io/awg-openwrt/24.10.3/) / [sunxi](https://2grey.github.io/awg-openwrt/24.10.3/sunxi/)

- OpenWrt version: `24.10.3`
- Target: `sunxi`
- Subtarget: `cortexa8`
- Package architecture: `arm_cortex-a8_vfpv3`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.3/targets/sunxi/cortexa8/](https://downloads.openwrt.org/releases/24.10.3/targets/sunxi/cortexa8/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.3/sunxi/cortexa8" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.3/sunxi/cortexa8/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.3/sunxi/cortexa8/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.3/sunxi/cortexa8/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.3/sunxi/cortexa8/Packages.sig)
- [amneziawg-tools_v24.10.3_arm_cortex-a8_vfpv3_sunxi_cortexa8.ipk](https://2grey.github.io/awg-openwrt/24.10.3/sunxi/cortexa8/amneziawg-tools_v24.10.3_arm_cortex-a8_vfpv3_sunxi_cortexa8.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.3/sunxi/cortexa8/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.3/sunxi/cortexa8/index.json)
- [kmod-amneziawg_v24.10.3_arm_cortex-a8_vfpv3_sunxi_cortexa8.ipk](https://2grey.github.io/awg-openwrt/24.10.3/sunxi/cortexa8/kmod-amneziawg_v24.10.3_arm_cortex-a8_vfpv3_sunxi_cortexa8.ipk)
- [luci-i18n-amneziawg-ru_v24.10.3_arm_cortex-a8_vfpv3_sunxi_cortexa8.ipk](https://2grey.github.io/awg-openwrt/24.10.3/sunxi/cortexa8/luci-i18n-amneziawg-ru_v24.10.3_arm_cortex-a8_vfpv3_sunxi_cortexa8.ipk)
- [luci-proto-amneziawg_v24.10.3_arm_cortex-a8_vfpv3_sunxi_cortexa8.ipk](https://2grey.github.io/awg-openwrt/24.10.3/sunxi/cortexa8/luci-proto-amneziawg_v24.10.3_arm_cortex-a8_vfpv3_sunxi_cortexa8.ipk)
