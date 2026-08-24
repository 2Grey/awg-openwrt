---
layout: default
title: "OpenWrt 24.10.6 malta/le64"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.6](https://2grey.github.io/awg-openwrt/24.10.6/) / [malta](https://2grey.github.io/awg-openwrt/24.10.6/malta/)

- OpenWrt version: `24.10.6`
- Target: `malta`
- Subtarget: `le64`
- Package architecture: `mips64el_mips64r2`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.6/targets/malta/le64/](https://downloads.openwrt.org/releases/24.10.6/targets/malta/le64/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.6/malta/le64" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.6/malta/le64/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.6/malta/le64/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.6/malta/le64/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.6/malta/le64/Packages.sig)
- [amneziawg-tools_v24.10.6_mips64el_mips64r2_malta_le64.ipk](https://2grey.github.io/awg-openwrt/24.10.6/malta/le64/amneziawg-tools_v24.10.6_mips64el_mips64r2_malta_le64.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.6/malta/le64/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.6/malta/le64/index.json)
- [kmod-amneziawg_v24.10.6_mips64el_mips64r2_malta_le64.ipk](https://2grey.github.io/awg-openwrt/24.10.6/malta/le64/kmod-amneziawg_v24.10.6_mips64el_mips64r2_malta_le64.ipk)
- [luci-i18n-amneziawg-ru_v24.10.6_mips64el_mips64r2_malta_le64.ipk](https://2grey.github.io/awg-openwrt/24.10.6/malta/le64/luci-i18n-amneziawg-ru_v24.10.6_mips64el_mips64r2_malta_le64.ipk)
- [luci-proto-amneziawg_v24.10.6_mips64el_mips64r2_malta_le64.ipk](https://2grey.github.io/awg-openwrt/24.10.6/malta/le64/luci-proto-amneziawg_v24.10.6_mips64el_mips64r2_malta_le64.ipk)
