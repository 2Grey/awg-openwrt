---
layout: default
title: "OpenWrt 24.10.7 zynq/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.7](https://2grey.github.io/awg-openwrt/24.10.7/) / [zynq](https://2grey.github.io/awg-openwrt/24.10.7/zynq/)

- OpenWrt version: `24.10.7`
- Target: `zynq`
- Subtarget: `generic`
- Package architecture: `arm_cortex-a9_neon`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.7/targets/zynq/generic/](https://downloads.openwrt.org/releases/24.10.7/targets/zynq/generic/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.7/zynq/generic" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.7/zynq/generic/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.7/zynq/generic/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.7/zynq/generic/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.7/zynq/generic/Packages.sig)
- [amneziawg-tools_v24.10.7_arm_cortex-a9_neon_zynq_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.7/zynq/generic/amneziawg-tools_v24.10.7_arm_cortex-a9_neon_zynq_generic.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.7/zynq/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.7/zynq/generic/index.json)
- [kmod-amneziawg_v24.10.7_arm_cortex-a9_neon_zynq_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.7/zynq/generic/kmod-amneziawg_v24.10.7_arm_cortex-a9_neon_zynq_generic.ipk)
- [luci-i18n-amneziawg-ru_v24.10.7_arm_cortex-a9_neon_zynq_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.7/zynq/generic/luci-i18n-amneziawg-ru_v24.10.7_arm_cortex-a9_neon_zynq_generic.ipk)
- [luci-proto-amneziawg_v24.10.7_arm_cortex-a9_neon_zynq_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.7/zynq/generic/luci-proto-amneziawg_v24.10.7_arm_cortex-a9_neon_zynq_generic.ipk)
