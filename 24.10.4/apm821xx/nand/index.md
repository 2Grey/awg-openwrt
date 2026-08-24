---
layout: default
title: "OpenWrt 24.10.4 apm821xx/nand"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.4](https://2grey.github.io/awg-openwrt/24.10.4/) / [apm821xx](https://2grey.github.io/awg-openwrt/24.10.4/apm821xx/)

- OpenWrt version: `24.10.4`
- Target: `apm821xx`
- Subtarget: `nand`
- Package architecture: `powerpc_464fp`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.4/targets/apm821xx/nand/](https://downloads.openwrt.org/releases/24.10.4/targets/apm821xx/nand/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.4/apm821xx/nand" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.4/apm821xx/nand/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.4/apm821xx/nand/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.4/apm821xx/nand/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.4/apm821xx/nand/Packages.sig)
- [amneziawg-tools_v24.10.4_powerpc_464fp_apm821xx_nand.ipk](https://2grey.github.io/awg-openwrt/24.10.4/apm821xx/nand/amneziawg-tools_v24.10.4_powerpc_464fp_apm821xx_nand.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.4/apm821xx/nand/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.4/apm821xx/nand/index.json)
- [kmod-amneziawg_v24.10.4_powerpc_464fp_apm821xx_nand.ipk](https://2grey.github.io/awg-openwrt/24.10.4/apm821xx/nand/kmod-amneziawg_v24.10.4_powerpc_464fp_apm821xx_nand.ipk)
- [luci-i18n-amneziawg-ru_v24.10.4_powerpc_464fp_apm821xx_nand.ipk](https://2grey.github.io/awg-openwrt/24.10.4/apm821xx/nand/luci-i18n-amneziawg-ru_v24.10.4_powerpc_464fp_apm821xx_nand.ipk)
- [luci-proto-amneziawg_v24.10.4_powerpc_464fp_apm821xx_nand.ipk](https://2grey.github.io/awg-openwrt/24.10.4/apm821xx/nand/luci-proto-amneziawg_v24.10.4_powerpc_464fp_apm821xx_nand.ipk)
