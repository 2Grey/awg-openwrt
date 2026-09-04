---
layout: default
title: "OpenWrt 24.10.2 lantiq/xrx200"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.2](https://2grey.github.io/awg-openwrt/24.10.2/) / [lantiq](https://2grey.github.io/awg-openwrt/24.10.2/lantiq/)

- OpenWrt version: `24.10.2`
- Target: `lantiq`
- Subtarget: `xrx200`
- Package architecture: `mips_24kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.2/targets/lantiq/xrx200/](https://downloads.openwrt.org/releases/24.10.2/targets/lantiq/xrx200/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.2/lantiq/xrx200" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.2/lantiq/xrx200/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.2/lantiq/xrx200/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.2/lantiq/xrx200/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.2/lantiq/xrx200/Packages.sig)
- [amneziawg-tools_v24.10.2_mips_24kc_lantiq_xrx200.ipk](https://2grey.github.io/awg-openwrt/24.10.2/lantiq/xrx200/amneziawg-tools_v24.10.2_mips_24kc_lantiq_xrx200.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.2/lantiq/xrx200/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.2/lantiq/xrx200/index.json)
- [kmod-amneziawg_v24.10.2_mips_24kc_lantiq_xrx200.ipk](https://2grey.github.io/awg-openwrt/24.10.2/lantiq/xrx200/kmod-amneziawg_v24.10.2_mips_24kc_lantiq_xrx200.ipk)
- [luci-i18n-amneziawg-ru_v24.10.2_mips_24kc_lantiq_xrx200.ipk](https://2grey.github.io/awg-openwrt/24.10.2/lantiq/xrx200/luci-i18n-amneziawg-ru_v24.10.2_mips_24kc_lantiq_xrx200.ipk)
- [luci-proto-amneziawg_v24.10.2_mips_24kc_lantiq_xrx200.ipk](https://2grey.github.io/awg-openwrt/24.10.2/lantiq/xrx200/luci-proto-amneziawg_v24.10.2_mips_24kc_lantiq_xrx200.ipk)
