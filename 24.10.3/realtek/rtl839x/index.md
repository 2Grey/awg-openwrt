---
layout: default
title: "OpenWrt 24.10.3 realtek/rtl839x"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.3](https://2grey.github.io/awg-openwrt/24.10.3/) / [realtek](https://2grey.github.io/awg-openwrt/24.10.3/realtek/)

- OpenWrt version: `24.10.3`
- Target: `realtek`
- Subtarget: `rtl839x`
- Package architecture: `mips_24kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.3/targets/realtek/rtl839x/](https://downloads.openwrt.org/releases/24.10.3/targets/realtek/rtl839x/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.3/realtek/rtl839x" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.3/realtek/rtl839x/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.3/realtek/rtl839x/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.3/realtek/rtl839x/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.3/realtek/rtl839x/Packages.sig)
- [amneziawg-tools_v24.10.3_mips_24kc_realtek_rtl839x.ipk](https://2grey.github.io/awg-openwrt/24.10.3/realtek/rtl839x/amneziawg-tools_v24.10.3_mips_24kc_realtek_rtl839x.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.3/realtek/rtl839x/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.3/realtek/rtl839x/index.json)
- [kmod-amneziawg_v24.10.3_mips_24kc_realtek_rtl839x.ipk](https://2grey.github.io/awg-openwrt/24.10.3/realtek/rtl839x/kmod-amneziawg_v24.10.3_mips_24kc_realtek_rtl839x.ipk)
- [luci-i18n-amneziawg-ru_v24.10.3_mips_24kc_realtek_rtl839x.ipk](https://2grey.github.io/awg-openwrt/24.10.3/realtek/rtl839x/luci-i18n-amneziawg-ru_v24.10.3_mips_24kc_realtek_rtl839x.ipk)
- [luci-proto-amneziawg_v24.10.3_mips_24kc_realtek_rtl839x.ipk](https://2grey.github.io/awg-openwrt/24.10.3/realtek/rtl839x/luci-proto-amneziawg_v24.10.3_mips_24kc_realtek_rtl839x.ipk)
