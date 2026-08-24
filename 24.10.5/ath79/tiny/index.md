---
layout: default
title: "OpenWrt 24.10.5 ath79/tiny"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.5](https://2grey.github.io/awg-openwrt/24.10.5/) / [ath79](https://2grey.github.io/awg-openwrt/24.10.5/ath79/)

- OpenWrt version: `24.10.5`
- Target: `ath79`
- Subtarget: `tiny`
- Package architecture: `mips_24kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.5/targets/ath79/tiny/](https://downloads.openwrt.org/releases/24.10.5/targets/ath79/tiny/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.5/ath79/tiny" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.5/ath79/tiny/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.5/ath79/tiny/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.5/ath79/tiny/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.5/ath79/tiny/Packages.sig)
- [amneziawg-tools_v24.10.5_mips_24kc_ath79_tiny.ipk](https://2grey.github.io/awg-openwrt/24.10.5/ath79/tiny/amneziawg-tools_v24.10.5_mips_24kc_ath79_tiny.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.5/ath79/tiny/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.5/ath79/tiny/index.json)
- [kmod-amneziawg_v24.10.5_mips_24kc_ath79_tiny.ipk](https://2grey.github.io/awg-openwrt/24.10.5/ath79/tiny/kmod-amneziawg_v24.10.5_mips_24kc_ath79_tiny.ipk)
- [luci-i18n-amneziawg-ru_v24.10.5_mips_24kc_ath79_tiny.ipk](https://2grey.github.io/awg-openwrt/24.10.5/ath79/tiny/luci-i18n-amneziawg-ru_v24.10.5_mips_24kc_ath79_tiny.ipk)
- [luci-proto-amneziawg_v24.10.5_mips_24kc_ath79_tiny.ipk](https://2grey.github.io/awg-openwrt/24.10.5/ath79/tiny/luci-proto-amneziawg_v24.10.5_mips_24kc_ath79_tiny.ipk)
