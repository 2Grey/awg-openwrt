---
layout: default
title: "OpenWrt 24.10.6 lantiq/ase"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.6](https://2grey.github.io/awg-openwrt/24.10.6/) / [lantiq](https://2grey.github.io/awg-openwrt/24.10.6/lantiq/)

- OpenWrt version: `24.10.6`
- Target: `lantiq`
- Subtarget: `ase`
- Package architecture: `mips_mips32`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.6/targets/lantiq/ase/](https://downloads.openwrt.org/releases/24.10.6/targets/lantiq/ase/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.6/lantiq/ase" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.6/lantiq/ase/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.6/lantiq/ase/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.6/lantiq/ase/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.6/lantiq/ase/Packages.sig)
- [amneziawg-tools_v24.10.6_mips_mips32_lantiq_ase.ipk](https://2grey.github.io/awg-openwrt/24.10.6/lantiq/ase/amneziawg-tools_v24.10.6_mips_mips32_lantiq_ase.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.6/lantiq/ase/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.6/lantiq/ase/index.json)
- [kmod-amneziawg_v24.10.6_mips_mips32_lantiq_ase.ipk](https://2grey.github.io/awg-openwrt/24.10.6/lantiq/ase/kmod-amneziawg_v24.10.6_mips_mips32_lantiq_ase.ipk)
- [luci-i18n-amneziawg-ru_v24.10.6_mips_mips32_lantiq_ase.ipk](https://2grey.github.io/awg-openwrt/24.10.6/lantiq/ase/luci-i18n-amneziawg-ru_v24.10.6_mips_mips32_lantiq_ase.ipk)
- [luci-proto-amneziawg_v24.10.6_mips_mips32_lantiq_ase.ipk](https://2grey.github.io/awg-openwrt/24.10.6/lantiq/ase/luci-proto-amneziawg_v24.10.6_mips_mips32_lantiq_ase.ipk)
