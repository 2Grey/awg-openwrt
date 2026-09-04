---
layout: default
title: "OpenWrt 24.10.3 apm821xx/sata"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.3](https://2grey.github.io/awg-openwrt/24.10.3/) / [apm821xx](https://2grey.github.io/awg-openwrt/24.10.3/apm821xx/)

- OpenWrt version: `24.10.3`
- Target: `apm821xx`
- Subtarget: `sata`
- Package architecture: `powerpc_464fp`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.3/targets/apm821xx/sata/](https://downloads.openwrt.org/releases/24.10.3/targets/apm821xx/sata/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.3/apm821xx/sata" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.3/apm821xx/sata/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.3/apm821xx/sata/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.3/apm821xx/sata/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.3/apm821xx/sata/Packages.sig)
- [amneziawg-tools_v24.10.3_powerpc_464fp_apm821xx_sata.ipk](https://2grey.github.io/awg-openwrt/24.10.3/apm821xx/sata/amneziawg-tools_v24.10.3_powerpc_464fp_apm821xx_sata.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.3/apm821xx/sata/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.3/apm821xx/sata/index.json)
- [kmod-amneziawg_v24.10.3_powerpc_464fp_apm821xx_sata.ipk](https://2grey.github.io/awg-openwrt/24.10.3/apm821xx/sata/kmod-amneziawg_v24.10.3_powerpc_464fp_apm821xx_sata.ipk)
- [luci-i18n-amneziawg-ru_v24.10.3_powerpc_464fp_apm821xx_sata.ipk](https://2grey.github.io/awg-openwrt/24.10.3/apm821xx/sata/luci-i18n-amneziawg-ru_v24.10.3_powerpc_464fp_apm821xx_sata.ipk)
- [luci-proto-amneziawg_v24.10.3_powerpc_464fp_apm821xx_sata.ipk](https://2grey.github.io/awg-openwrt/24.10.3/apm821xx/sata/luci-proto-amneziawg_v24.10.3_powerpc_464fp_apm821xx_sata.ipk)
