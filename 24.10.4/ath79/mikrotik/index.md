---
layout: default
title: "OpenWrt 24.10.4 ath79/mikrotik"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.4](https://2grey.github.io/awg-openwrt/24.10.4/) / [ath79](https://2grey.github.io/awg-openwrt/24.10.4/ath79/)

- OpenWrt version: `24.10.4`
- Target: `ath79`
- Subtarget: `mikrotik`
- Package architecture: `mips_24kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.4/targets/ath79/mikrotik/](https://downloads.openwrt.org/releases/24.10.4/targets/ath79/mikrotik/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.4/ath79/mikrotik" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.4/ath79/mikrotik/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.4/ath79/mikrotik/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.4/ath79/mikrotik/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.4/ath79/mikrotik/Packages.sig)
- [amneziawg-tools_v24.10.4_mips_24kc_ath79_mikrotik.ipk](https://2grey.github.io/awg-openwrt/24.10.4/ath79/mikrotik/amneziawg-tools_v24.10.4_mips_24kc_ath79_mikrotik.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.4/ath79/mikrotik/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.4/ath79/mikrotik/index.json)
- [kmod-amneziawg_v24.10.4_mips_24kc_ath79_mikrotik.ipk](https://2grey.github.io/awg-openwrt/24.10.4/ath79/mikrotik/kmod-amneziawg_v24.10.4_mips_24kc_ath79_mikrotik.ipk)
- [luci-i18n-amneziawg-ru_v24.10.4_mips_24kc_ath79_mikrotik.ipk](https://2grey.github.io/awg-openwrt/24.10.4/ath79/mikrotik/luci-i18n-amneziawg-ru_v24.10.4_mips_24kc_ath79_mikrotik.ipk)
- [luci-proto-amneziawg_v24.10.4_mips_24kc_ath79_mikrotik.ipk](https://2grey.github.io/awg-openwrt/24.10.4/ath79/mikrotik/luci-proto-amneziawg_v24.10.4_mips_24kc_ath79_mikrotik.ipk)
