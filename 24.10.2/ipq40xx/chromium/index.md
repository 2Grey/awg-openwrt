---
layout: default
title: "OpenWrt 24.10.2 ipq40xx/chromium"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.2](https://2grey.github.io/awg-openwrt/24.10.2/) / [ipq40xx](https://2grey.github.io/awg-openwrt/24.10.2/ipq40xx/)

- OpenWrt version: `24.10.2`
- Target: `ipq40xx`
- Subtarget: `chromium`
- Package architecture: `arm_cortex-a7_neon-vfpv4`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.2/targets/ipq40xx/chromium/](https://downloads.openwrt.org/releases/24.10.2/targets/ipq40xx/chromium/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.2/ipq40xx/chromium" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.2/ipq40xx/chromium/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.2/ipq40xx/chromium/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.2/ipq40xx/chromium/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.2/ipq40xx/chromium/Packages.sig)
- [amneziawg-tools_v24.10.2_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.ipk](https://2grey.github.io/awg-openwrt/24.10.2/ipq40xx/chromium/amneziawg-tools_v24.10.2_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.2/ipq40xx/chromium/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.2/ipq40xx/chromium/index.json)
- [kmod-amneziawg_v24.10.2_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.ipk](https://2grey.github.io/awg-openwrt/24.10.2/ipq40xx/chromium/kmod-amneziawg_v24.10.2_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.ipk)
- [luci-i18n-amneziawg-ru_v24.10.2_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.ipk](https://2grey.github.io/awg-openwrt/24.10.2/ipq40xx/chromium/luci-i18n-amneziawg-ru_v24.10.2_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.ipk)
- [luci-proto-amneziawg_v24.10.2_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.ipk](https://2grey.github.io/awg-openwrt/24.10.2/ipq40xx/chromium/luci-proto-amneziawg_v24.10.2_arm_cortex-a7_neon-vfpv4_ipq40xx_chromium.ipk)
