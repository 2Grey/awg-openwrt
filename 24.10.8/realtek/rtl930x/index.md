---
layout: default
title: "OpenWrt 24.10.8 realtek/rtl930x"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.8](https://2grey.github.io/awg-openwrt/24.10.8/) / [realtek](https://2grey.github.io/awg-openwrt/24.10.8/realtek/)

- OpenWrt version: `24.10.8`
- Target: `realtek`
- Subtarget: `rtl930x`
- Package architecture: `mips_24kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.8/targets/realtek/rtl930x/](https://downloads.openwrt.org/releases/24.10.8/targets/realtek/rtl930x/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.8/realtek/rtl930x" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.8/realtek/rtl930x/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.8/realtek/rtl930x/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.8/realtek/rtl930x/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.8/realtek/rtl930x/Packages.sig)
- [amneziawg-tools_v24.10.8_mips_24kc_realtek_rtl930x.ipk](https://2grey.github.io/awg-openwrt/24.10.8/realtek/rtl930x/amneziawg-tools_v24.10.8_mips_24kc_realtek_rtl930x.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.8/realtek/rtl930x/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.8/realtek/rtl930x/index.json)
- [kmod-amneziawg_v24.10.8_mips_24kc_realtek_rtl930x.ipk](https://2grey.github.io/awg-openwrt/24.10.8/realtek/rtl930x/kmod-amneziawg_v24.10.8_mips_24kc_realtek_rtl930x.ipk)
- [luci-i18n-amneziawg-ru_v24.10.8_mips_24kc_realtek_rtl930x.ipk](https://2grey.github.io/awg-openwrt/24.10.8/realtek/rtl930x/luci-i18n-amneziawg-ru_v24.10.8_mips_24kc_realtek_rtl930x.ipk)
- [luci-proto-amneziawg_v24.10.8_mips_24kc_realtek_rtl930x.ipk](https://2grey.github.io/awg-openwrt/24.10.8/realtek/rtl930x/luci-proto-amneziawg_v24.10.8_mips_24kc_realtek_rtl930x.ipk)
