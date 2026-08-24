---
layout: default
title: "OpenWrt 24.10.8 pistachio/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.8](https://2grey.github.io/awg-openwrt/24.10.8/) / [pistachio](https://2grey.github.io/awg-openwrt/24.10.8/pistachio/)

- OpenWrt version: `24.10.8`
- Target: `pistachio`
- Subtarget: `generic`
- Package architecture: `mipsel_24kc_24kf`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.8/targets/pistachio/generic/](https://downloads.openwrt.org/releases/24.10.8/targets/pistachio/generic/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.8/pistachio/generic" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.8/pistachio/generic/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.8/pistachio/generic/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.8/pistachio/generic/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.8/pistachio/generic/Packages.sig)
- [amneziawg-tools_v24.10.8_mipsel_24kc_24kf_pistachio_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.8/pistachio/generic/amneziawg-tools_v24.10.8_mipsel_24kc_24kf_pistachio_generic.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.8/pistachio/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.8/pistachio/generic/index.json)
- [kmod-amneziawg_v24.10.8_mipsel_24kc_24kf_pistachio_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.8/pistachio/generic/kmod-amneziawg_v24.10.8_mipsel_24kc_24kf_pistachio_generic.ipk)
- [luci-i18n-amneziawg-ru_v24.10.8_mipsel_24kc_24kf_pistachio_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.8/pistachio/generic/luci-i18n-amneziawg-ru_v24.10.8_mipsel_24kc_24kf_pistachio_generic.ipk)
- [luci-proto-amneziawg_v24.10.8_mipsel_24kc_24kf_pistachio_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.8/pistachio/generic/luci-proto-amneziawg_v24.10.8_mipsel_24kc_24kf_pistachio_generic.ipk)
