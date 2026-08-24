---
layout: default
title: "OpenWrt 24.10.6 kirkwood/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.6](https://2grey.github.io/awg-openwrt/24.10.6/) / [kirkwood](https://2grey.github.io/awg-openwrt/24.10.6/kirkwood/)

- OpenWrt version: `24.10.6`
- Target: `kirkwood`
- Subtarget: `generic`
- Package architecture: `arm_xscale`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.6/targets/kirkwood/generic/](https://downloads.openwrt.org/releases/24.10.6/targets/kirkwood/generic/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.6/kirkwood/generic" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.6/kirkwood/generic/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.6/kirkwood/generic/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.6/kirkwood/generic/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.6/kirkwood/generic/Packages.sig)
- [amneziawg-tools_v24.10.6_arm_xscale_kirkwood_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.6/kirkwood/generic/amneziawg-tools_v24.10.6_arm_xscale_kirkwood_generic.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.6/kirkwood/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.6/kirkwood/generic/index.json)
- [kmod-amneziawg_v24.10.6_arm_xscale_kirkwood_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.6/kirkwood/generic/kmod-amneziawg_v24.10.6_arm_xscale_kirkwood_generic.ipk)
- [luci-i18n-amneziawg-ru_v24.10.6_arm_xscale_kirkwood_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.6/kirkwood/generic/luci-i18n-amneziawg-ru_v24.10.6_arm_xscale_kirkwood_generic.ipk)
- [luci-proto-amneziawg_v24.10.6_arm_xscale_kirkwood_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.6/kirkwood/generic/luci-proto-amneziawg_v24.10.6_arm_xscale_kirkwood_generic.ipk)
