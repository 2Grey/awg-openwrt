---
layout: default
title: "OpenWrt 24.10.7 ath79/nand"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.7](https://2grey.github.io/awg-openwrt/24.10.7/) / [ath79](https://2grey.github.io/awg-openwrt/24.10.7/ath79/)

- OpenWrt version: `24.10.7`
- Target: `ath79`
- Subtarget: `nand`
- Package architecture: `mips_24kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.7/targets/ath79/nand/](https://downloads.openwrt.org/releases/24.10.7/targets/ath79/nand/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.7/ath79/nand" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.7/ath79/nand/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.7/ath79/nand/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.7/ath79/nand/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.7/ath79/nand/Packages.sig)
- [amneziawg-tools_v24.10.7_mips_24kc_ath79_nand.ipk](https://2grey.github.io/awg-openwrt/24.10.7/ath79/nand/amneziawg-tools_v24.10.7_mips_24kc_ath79_nand.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.7/ath79/nand/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.7/ath79/nand/index.json)
- [kmod-amneziawg_v24.10.7_mips_24kc_ath79_nand.ipk](https://2grey.github.io/awg-openwrt/24.10.7/ath79/nand/kmod-amneziawg_v24.10.7_mips_24kc_ath79_nand.ipk)
- [luci-i18n-amneziawg-ru_v24.10.7_mips_24kc_ath79_nand.ipk](https://2grey.github.io/awg-openwrt/24.10.7/ath79/nand/luci-i18n-amneziawg-ru_v24.10.7_mips_24kc_ath79_nand.ipk)
- [luci-proto-amneziawg_v24.10.7_mips_24kc_ath79_nand.ipk](https://2grey.github.io/awg-openwrt/24.10.7/ath79/nand/luci-proto-amneziawg_v24.10.7_mips_24kc_ath79_nand.ipk)
