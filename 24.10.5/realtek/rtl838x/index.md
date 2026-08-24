---
layout: default
title: "OpenWrt 24.10.5 realtek/rtl838x"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.5](https://2grey.github.io/awg-openwrt/24.10.5/) / [realtek](https://2grey.github.io/awg-openwrt/24.10.5/realtek/)

- OpenWrt version: `24.10.5`
- Target: `realtek`
- Subtarget: `rtl838x`
- Package architecture: `mips_4kec`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.5/targets/realtek/rtl838x/](https://downloads.openwrt.org/releases/24.10.5/targets/realtek/rtl838x/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.5/realtek/rtl838x" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.5/realtek/rtl838x/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.5/realtek/rtl838x/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.5/realtek/rtl838x/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.5/realtek/rtl838x/Packages.sig)
- [amneziawg-tools_v24.10.5_mips_4kec_realtek_rtl838x.ipk](https://2grey.github.io/awg-openwrt/24.10.5/realtek/rtl838x/amneziawg-tools_v24.10.5_mips_4kec_realtek_rtl838x.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.5/realtek/rtl838x/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.5/realtek/rtl838x/index.json)
- [kmod-amneziawg_v24.10.5_mips_4kec_realtek_rtl838x.ipk](https://2grey.github.io/awg-openwrt/24.10.5/realtek/rtl838x/kmod-amneziawg_v24.10.5_mips_4kec_realtek_rtl838x.ipk)
- [luci-i18n-amneziawg-ru_v24.10.5_mips_4kec_realtek_rtl838x.ipk](https://2grey.github.io/awg-openwrt/24.10.5/realtek/rtl838x/luci-i18n-amneziawg-ru_v24.10.5_mips_4kec_realtek_rtl838x.ipk)
- [luci-proto-amneziawg_v24.10.5_mips_4kec_realtek_rtl838x.ipk](https://2grey.github.io/awg-openwrt/24.10.5/realtek/rtl838x/luci-proto-amneziawg_v24.10.5_mips_4kec_realtek_rtl838x.ipk)
