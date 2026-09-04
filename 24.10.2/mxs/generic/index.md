---
layout: default
title: "OpenWrt 24.10.2 mxs/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.2](https://2grey.github.io/awg-openwrt/24.10.2/) / [mxs](https://2grey.github.io/awg-openwrt/24.10.2/mxs/)

- OpenWrt version: `24.10.2`
- Target: `mxs`
- Subtarget: `generic`
- Package architecture: `arm_arm926ej-s`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.2/targets/mxs/generic/](https://downloads.openwrt.org/releases/24.10.2/targets/mxs/generic/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.2/mxs/generic" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.2/mxs/generic/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.2/mxs/generic/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.2/mxs/generic/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.2/mxs/generic/Packages.sig)
- [amneziawg-tools_v24.10.2_arm_arm926ej-s_mxs_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.2/mxs/generic/amneziawg-tools_v24.10.2_arm_arm926ej-s_mxs_generic.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.2/mxs/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.2/mxs/generic/index.json)
- [kmod-amneziawg_v24.10.2_arm_arm926ej-s_mxs_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.2/mxs/generic/kmod-amneziawg_v24.10.2_arm_arm926ej-s_mxs_generic.ipk)
- [luci-i18n-amneziawg-ru_v24.10.2_arm_arm926ej-s_mxs_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.2/mxs/generic/luci-i18n-amneziawg-ru_v24.10.2_arm_arm926ej-s_mxs_generic.ipk)
- [luci-proto-amneziawg_v24.10.2_arm_arm926ej-s_mxs_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.2/mxs/generic/luci-proto-amneziawg_v24.10.2_arm_arm926ej-s_mxs_generic.ipk)
