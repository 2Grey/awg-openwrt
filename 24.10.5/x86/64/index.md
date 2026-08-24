---
layout: default
title: "OpenWrt 24.10.5 x86/64"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.5](https://2grey.github.io/awg-openwrt/24.10.5/) / [x86](https://2grey.github.io/awg-openwrt/24.10.5/x86/)

- OpenWrt version: `24.10.5`
- Target: `x86`
- Subtarget: `64`
- Package architecture: `x86_64`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.5/targets/x86/64/](https://downloads.openwrt.org/releases/24.10.5/targets/x86/64/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.5/x86/64" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.5/x86/64/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.5/x86/64/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.5/x86/64/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.5/x86/64/Packages.sig)
- [amneziawg-tools_v24.10.5_x86_64_x86_64.ipk](https://2grey.github.io/awg-openwrt/24.10.5/x86/64/amneziawg-tools_v24.10.5_x86_64_x86_64.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.5/x86/64/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.5/x86/64/index.json)
- [kmod-amneziawg_v24.10.5_x86_64_x86_64.ipk](https://2grey.github.io/awg-openwrt/24.10.5/x86/64/kmod-amneziawg_v24.10.5_x86_64_x86_64.ipk)
- [luci-i18n-amneziawg-ru_v24.10.5_x86_64_x86_64.ipk](https://2grey.github.io/awg-openwrt/24.10.5/x86/64/luci-i18n-amneziawg-ru_v24.10.5_x86_64_x86_64.ipk)
- [luci-proto-amneziawg_v24.10.5_x86_64_x86_64.ipk](https://2grey.github.io/awg-openwrt/24.10.5/x86/64/luci-proto-amneziawg_v24.10.5_x86_64_x86_64.ipk)
