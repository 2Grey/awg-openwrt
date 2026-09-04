---
layout: default
title: "OpenWrt 24.10.3 ipq40xx/mikrotik"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.3](https://2grey.github.io/awg-openwrt/24.10.3/) / [ipq40xx](https://2grey.github.io/awg-openwrt/24.10.3/ipq40xx/)

- OpenWrt version: `24.10.3`
- Target: `ipq40xx`
- Subtarget: `mikrotik`
- Package architecture: `arm_cortex-a7_neon-vfpv4`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.3/targets/ipq40xx/mikrotik/](https://downloads.openwrt.org/releases/24.10.3/targets/ipq40xx/mikrotik/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.3/ipq40xx/mikrotik" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.3/ipq40xx/mikrotik/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.3/ipq40xx/mikrotik/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.3/ipq40xx/mikrotik/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.3/ipq40xx/mikrotik/Packages.sig)
- [amneziawg-tools_v24.10.3_arm_cortex-a7_neon-vfpv4_ipq40xx_mikrotik.ipk](https://2grey.github.io/awg-openwrt/24.10.3/ipq40xx/mikrotik/amneziawg-tools_v24.10.3_arm_cortex-a7_neon-vfpv4_ipq40xx_mikrotik.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.3/ipq40xx/mikrotik/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.3/ipq40xx/mikrotik/index.json)
- [kmod-amneziawg_v24.10.3_arm_cortex-a7_neon-vfpv4_ipq40xx_mikrotik.ipk](https://2grey.github.io/awg-openwrt/24.10.3/ipq40xx/mikrotik/kmod-amneziawg_v24.10.3_arm_cortex-a7_neon-vfpv4_ipq40xx_mikrotik.ipk)
- [luci-i18n-amneziawg-ru_v24.10.3_arm_cortex-a7_neon-vfpv4_ipq40xx_mikrotik.ipk](https://2grey.github.io/awg-openwrt/24.10.3/ipq40xx/mikrotik/luci-i18n-amneziawg-ru_v24.10.3_arm_cortex-a7_neon-vfpv4_ipq40xx_mikrotik.ipk)
- [luci-proto-amneziawg_v24.10.3_arm_cortex-a7_neon-vfpv4_ipq40xx_mikrotik.ipk](https://2grey.github.io/awg-openwrt/24.10.3/ipq40xx/mikrotik/luci-proto-amneziawg_v24.10.3_arm_cortex-a7_neon-vfpv4_ipq40xx_mikrotik.ipk)
