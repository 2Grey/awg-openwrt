---
layout: default
title: "OpenWrt 24.10.8 stm32/stm32mp1"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.8](https://2grey.github.io/awg-openwrt/24.10.8/) / [stm32](https://2grey.github.io/awg-openwrt/24.10.8/stm32/)

- OpenWrt version: `24.10.8`
- Target: `stm32`
- Subtarget: `stm32mp1`
- Package architecture: `arm_cortex-a7_neon-vfpv4`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.8/targets/stm32/stm32mp1/](https://downloads.openwrt.org/releases/24.10.8/targets/stm32/stm32mp1/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.8/stm32/stm32mp1" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.8/stm32/stm32mp1/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.8/stm32/stm32mp1/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.8/stm32/stm32mp1/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.8/stm32/stm32mp1/Packages.sig)
- [amneziawg-tools_v24.10.8_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.ipk](https://2grey.github.io/awg-openwrt/24.10.8/stm32/stm32mp1/amneziawg-tools_v24.10.8_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.8/stm32/stm32mp1/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.8/stm32/stm32mp1/index.json)
- [kmod-amneziawg_v24.10.8_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.ipk](https://2grey.github.io/awg-openwrt/24.10.8/stm32/stm32mp1/kmod-amneziawg_v24.10.8_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.ipk)
- [luci-i18n-amneziawg-ru_v24.10.8_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.ipk](https://2grey.github.io/awg-openwrt/24.10.8/stm32/stm32mp1/luci-i18n-amneziawg-ru_v24.10.8_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.ipk)
- [luci-proto-amneziawg_v24.10.8_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.ipk](https://2grey.github.io/awg-openwrt/24.10.8/stm32/stm32mp1/luci-proto-amneziawg_v24.10.8_arm_cortex-a7_neon-vfpv4_stm32_stm32mp1.ipk)
