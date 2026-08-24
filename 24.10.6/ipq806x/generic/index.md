---
layout: default
title: "OpenWrt 24.10.6 ipq806x/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.6](https://2grey.github.io/awg-openwrt/24.10.6/) / [ipq806x](https://2grey.github.io/awg-openwrt/24.10.6/ipq806x/)

- OpenWrt version: `24.10.6`
- Target: `ipq806x`
- Subtarget: `generic`
- Package architecture: `arm_cortex-a15_neon-vfpv4`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.6/targets/ipq806x/generic/](https://downloads.openwrt.org/releases/24.10.6/targets/ipq806x/generic/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.6/ipq806x/generic" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.6/ipq806x/generic/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.6/ipq806x/generic/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.6/ipq806x/generic/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.6/ipq806x/generic/Packages.sig)
- [amneziawg-tools_v24.10.6_arm_cortex-a15_neon-vfpv4_ipq806x_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.6/ipq806x/generic/amneziawg-tools_v24.10.6_arm_cortex-a15_neon-vfpv4_ipq806x_generic.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.6/ipq806x/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.6/ipq806x/generic/index.json)
- [kmod-amneziawg_v24.10.6_arm_cortex-a15_neon-vfpv4_ipq806x_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.6/ipq806x/generic/kmod-amneziawg_v24.10.6_arm_cortex-a15_neon-vfpv4_ipq806x_generic.ipk)
- [luci-i18n-amneziawg-ru_v24.10.6_arm_cortex-a15_neon-vfpv4_ipq806x_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.6/ipq806x/generic/luci-i18n-amneziawg-ru_v24.10.6_arm_cortex-a15_neon-vfpv4_ipq806x_generic.ipk)
- [luci-proto-amneziawg_v24.10.6_arm_cortex-a15_neon-vfpv4_ipq806x_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.6/ipq806x/generic/luci-proto-amneziawg_v24.10.6_arm_cortex-a15_neon-vfpv4_ipq806x_generic.ipk)
