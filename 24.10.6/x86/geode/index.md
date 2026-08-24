---
layout: default
title: "OpenWrt 24.10.6 x86/geode"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.6](https://2grey.github.io/awg-openwrt/24.10.6/) / [x86](https://2grey.github.io/awg-openwrt/24.10.6/x86/)

- OpenWrt version: `24.10.6`
- Target: `x86`
- Subtarget: `geode`
- Package architecture: `i386_pentium-mmx`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.6/targets/x86/geode/](https://downloads.openwrt.org/releases/24.10.6/targets/x86/geode/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.6/x86/geode" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.6/x86/geode/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.6/x86/geode/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.6/x86/geode/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.6/x86/geode/Packages.sig)
- [amneziawg-tools_v24.10.6_i386_pentium-mmx_x86_geode.ipk](https://2grey.github.io/awg-openwrt/24.10.6/x86/geode/amneziawg-tools_v24.10.6_i386_pentium-mmx_x86_geode.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.6/x86/geode/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.6/x86/geode/index.json)
- [kmod-amneziawg_v24.10.6_i386_pentium-mmx_x86_geode.ipk](https://2grey.github.io/awg-openwrt/24.10.6/x86/geode/kmod-amneziawg_v24.10.6_i386_pentium-mmx_x86_geode.ipk)
- [luci-i18n-amneziawg-ru_v24.10.6_i386_pentium-mmx_x86_geode.ipk](https://2grey.github.io/awg-openwrt/24.10.6/x86/geode/luci-i18n-amneziawg-ru_v24.10.6_i386_pentium-mmx_x86_geode.ipk)
- [luci-proto-amneziawg_v24.10.6_i386_pentium-mmx_x86_geode.ipk](https://2grey.github.io/awg-openwrt/24.10.6/x86/geode/luci-proto-amneziawg_v24.10.6_i386_pentium-mmx_x86_geode.ipk)
