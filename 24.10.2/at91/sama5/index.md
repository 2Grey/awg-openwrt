---
layout: default
title: "OpenWrt 24.10.2 at91/sama5"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.2](https://2grey.github.io/awg-openwrt/24.10.2/) / [at91](https://2grey.github.io/awg-openwrt/24.10.2/at91/)

- OpenWrt version: `24.10.2`
- Target: `at91`
- Subtarget: `sama5`
- Package architecture: `arm_cortex-a5_vfpv4`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.2/targets/at91/sama5/](https://downloads.openwrt.org/releases/24.10.2/targets/at91/sama5/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.2/at91/sama5" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.2/at91/sama5/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.2/at91/sama5/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.2/at91/sama5/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.2/at91/sama5/Packages.sig)
- [amneziawg-tools_v24.10.2_arm_cortex-a5_vfpv4_at91_sama5.ipk](https://2grey.github.io/awg-openwrt/24.10.2/at91/sama5/amneziawg-tools_v24.10.2_arm_cortex-a5_vfpv4_at91_sama5.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.2/at91/sama5/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.2/at91/sama5/index.json)
- [kmod-amneziawg_v24.10.2_arm_cortex-a5_vfpv4_at91_sama5.ipk](https://2grey.github.io/awg-openwrt/24.10.2/at91/sama5/kmod-amneziawg_v24.10.2_arm_cortex-a5_vfpv4_at91_sama5.ipk)
- [luci-i18n-amneziawg-ru_v24.10.2_arm_cortex-a5_vfpv4_at91_sama5.ipk](https://2grey.github.io/awg-openwrt/24.10.2/at91/sama5/luci-i18n-amneziawg-ru_v24.10.2_arm_cortex-a5_vfpv4_at91_sama5.ipk)
- [luci-proto-amneziawg_v24.10.2_arm_cortex-a5_vfpv4_at91_sama5.ipk](https://2grey.github.io/awg-openwrt/24.10.2/at91/sama5/luci-proto-amneziawg_v24.10.2_arm_cortex-a5_vfpv4_at91_sama5.ipk)
