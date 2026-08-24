---
layout: default
title: "OpenWrt 24.10.6 imx/cortexa7"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.6](https://2grey.github.io/awg-openwrt/24.10.6/) / [imx](https://2grey.github.io/awg-openwrt/24.10.6/imx/)

- OpenWrt version: `24.10.6`
- Target: `imx`
- Subtarget: `cortexa7`
- Package architecture: `arm_cortex-a7_neon-vfpv4`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.6/targets/imx/cortexa7/](https://downloads.openwrt.org/releases/24.10.6/targets/imx/cortexa7/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.6/imx/cortexa7" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.6/imx/cortexa7/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.6/imx/cortexa7/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.6/imx/cortexa7/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.6/imx/cortexa7/Packages.sig)
- [amneziawg-tools_v24.10.6_arm_cortex-a7_neon-vfpv4_imx_cortexa7.ipk](https://2grey.github.io/awg-openwrt/24.10.6/imx/cortexa7/amneziawg-tools_v24.10.6_arm_cortex-a7_neon-vfpv4_imx_cortexa7.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.6/imx/cortexa7/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.6/imx/cortexa7/index.json)
- [kmod-amneziawg_v24.10.6_arm_cortex-a7_neon-vfpv4_imx_cortexa7.ipk](https://2grey.github.io/awg-openwrt/24.10.6/imx/cortexa7/kmod-amneziawg_v24.10.6_arm_cortex-a7_neon-vfpv4_imx_cortexa7.ipk)
- [luci-i18n-amneziawg-ru_v24.10.6_arm_cortex-a7_neon-vfpv4_imx_cortexa7.ipk](https://2grey.github.io/awg-openwrt/24.10.6/imx/cortexa7/luci-i18n-amneziawg-ru_v24.10.6_arm_cortex-a7_neon-vfpv4_imx_cortexa7.ipk)
- [luci-proto-amneziawg_v24.10.6_arm_cortex-a7_neon-vfpv4_imx_cortexa7.ipk](https://2grey.github.io/awg-openwrt/24.10.6/imx/cortexa7/luci-proto-amneziawg_v24.10.6_arm_cortex-a7_neon-vfpv4_imx_cortexa7.ipk)
