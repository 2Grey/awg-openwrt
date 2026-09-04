---
layout: default
title: "OpenWrt 24.10.2 armsr/armv8"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.2](https://2grey.github.io/awg-openwrt/24.10.2/) / [armsr](https://2grey.github.io/awg-openwrt/24.10.2/armsr/)

- OpenWrt version: `24.10.2`
- Target: `armsr`
- Subtarget: `armv8`
- Package architecture: `aarch64_generic`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.2/targets/armsr/armv8/](https://downloads.openwrt.org/releases/24.10.2/targets/armsr/armv8/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.2/armsr/armv8" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.2/armsr/armv8/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.2/armsr/armv8/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.2/armsr/armv8/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.2/armsr/armv8/Packages.sig)
- [amneziawg-tools_v24.10.2_aarch64_generic_armsr_armv8.ipk](https://2grey.github.io/awg-openwrt/24.10.2/armsr/armv8/amneziawg-tools_v24.10.2_aarch64_generic_armsr_armv8.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.2/armsr/armv8/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.2/armsr/armv8/index.json)
- [kmod-amneziawg_v24.10.2_aarch64_generic_armsr_armv8.ipk](https://2grey.github.io/awg-openwrt/24.10.2/armsr/armv8/kmod-amneziawg_v24.10.2_aarch64_generic_armsr_armv8.ipk)
- [luci-i18n-amneziawg-ru_v24.10.2_aarch64_generic_armsr_armv8.ipk](https://2grey.github.io/awg-openwrt/24.10.2/armsr/armv8/luci-i18n-amneziawg-ru_v24.10.2_aarch64_generic_armsr_armv8.ipk)
- [luci-proto-amneziawg_v24.10.2_aarch64_generic_armsr_armv8.ipk](https://2grey.github.io/awg-openwrt/24.10.2/armsr/armv8/luci-proto-amneziawg_v24.10.2_aarch64_generic_armsr_armv8.ipk)
