---
layout: default
title: "OpenWrt 24.10.5 lantiq/xway"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.5](https://2grey.github.io/awg-openwrt/24.10.5/) / [lantiq](https://2grey.github.io/awg-openwrt/24.10.5/lantiq/)

- OpenWrt version: `24.10.5`
- Target: `lantiq`
- Subtarget: `xway`
- Package architecture: `mips_24kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.5/targets/lantiq/xway/](https://downloads.openwrt.org/releases/24.10.5/targets/lantiq/xway/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.5/lantiq/xway" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.5/lantiq/xway/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.5/lantiq/xway/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.5/lantiq/xway/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.5/lantiq/xway/Packages.sig)
- [amneziawg-tools_v24.10.5_mips_24kc_lantiq_xway.ipk](https://2grey.github.io/awg-openwrt/24.10.5/lantiq/xway/amneziawg-tools_v24.10.5_mips_24kc_lantiq_xway.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.5/lantiq/xway/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.5/lantiq/xway/index.json)
- [kmod-amneziawg_v24.10.5_mips_24kc_lantiq_xway.ipk](https://2grey.github.io/awg-openwrt/24.10.5/lantiq/xway/kmod-amneziawg_v24.10.5_mips_24kc_lantiq_xway.ipk)
- [luci-i18n-amneziawg-ru_v24.10.5_mips_24kc_lantiq_xway.ipk](https://2grey.github.io/awg-openwrt/24.10.5/lantiq/xway/luci-i18n-amneziawg-ru_v24.10.5_mips_24kc_lantiq_xway.ipk)
- [luci-proto-amneziawg_v24.10.5_mips_24kc_lantiq_xway.ipk](https://2grey.github.io/awg-openwrt/24.10.5/lantiq/xway/luci-proto-amneziawg_v24.10.5_mips_24kc_lantiq_xway.ipk)
