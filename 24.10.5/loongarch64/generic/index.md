---
layout: default
title: "OpenWrt 24.10.5 loongarch64/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.5](https://2grey.github.io/awg-openwrt/24.10.5/) / [loongarch64](https://2grey.github.io/awg-openwrt/24.10.5/loongarch64/)

- OpenWrt version: `24.10.5`
- Target: `loongarch64`
- Subtarget: `generic`
- Package architecture: `loongarch64_generic`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.5/targets/loongarch64/generic/](https://downloads.openwrt.org/releases/24.10.5/targets/loongarch64/generic/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.5/loongarch64/generic" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.5/loongarch64/generic/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.5/loongarch64/generic/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.5/loongarch64/generic/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.5/loongarch64/generic/Packages.sig)
- [amneziawg-tools_v24.10.5_loongarch64_generic_loongarch64_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.5/loongarch64/generic/amneziawg-tools_v24.10.5_loongarch64_generic_loongarch64_generic.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.5/loongarch64/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.5/loongarch64/generic/index.json)
- [kmod-amneziawg_v24.10.5_loongarch64_generic_loongarch64_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.5/loongarch64/generic/kmod-amneziawg_v24.10.5_loongarch64_generic_loongarch64_generic.ipk)
- [luci-i18n-amneziawg-ru_v24.10.5_loongarch64_generic_loongarch64_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.5/loongarch64/generic/luci-i18n-amneziawg-ru_v24.10.5_loongarch64_generic_loongarch64_generic.ipk)
- [luci-proto-amneziawg_v24.10.5_loongarch64_generic_loongarch64_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.5/loongarch64/generic/luci-proto-amneziawg_v24.10.5_loongarch64_generic_loongarch64_generic.ipk)
