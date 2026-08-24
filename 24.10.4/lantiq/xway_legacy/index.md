---
layout: default
title: "OpenWrt 24.10.4 lantiq/xway_legacy"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.4](https://2grey.github.io/awg-openwrt/24.10.4/) / [lantiq](https://2grey.github.io/awg-openwrt/24.10.4/lantiq/)

- OpenWrt version: `24.10.4`
- Target: `lantiq`
- Subtarget: `xway_legacy`
- Package architecture: `mips_24kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.4/targets/lantiq/xway_legacy/](https://downloads.openwrt.org/releases/24.10.4/targets/lantiq/xway_legacy/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.4/lantiq/xway_legacy" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.4/lantiq/xway_legacy/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.4/lantiq/xway_legacy/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.4/lantiq/xway_legacy/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.4/lantiq/xway_legacy/Packages.sig)
- [amneziawg-tools_v24.10.4_mips_24kc_lantiq_xway_legacy.ipk](https://2grey.github.io/awg-openwrt/24.10.4/lantiq/xway_legacy/amneziawg-tools_v24.10.4_mips_24kc_lantiq_xway_legacy.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.4/lantiq/xway_legacy/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.4/lantiq/xway_legacy/index.json)
- [kmod-amneziawg_v24.10.4_mips_24kc_lantiq_xway_legacy.ipk](https://2grey.github.io/awg-openwrt/24.10.4/lantiq/xway_legacy/kmod-amneziawg_v24.10.4_mips_24kc_lantiq_xway_legacy.ipk)
- [luci-i18n-amneziawg-ru_v24.10.4_mips_24kc_lantiq_xway_legacy.ipk](https://2grey.github.io/awg-openwrt/24.10.4/lantiq/xway_legacy/luci-i18n-amneziawg-ru_v24.10.4_mips_24kc_lantiq_xway_legacy.ipk)
- [luci-proto-amneziawg_v24.10.4_mips_24kc_lantiq_xway_legacy.ipk](https://2grey.github.io/awg-openwrt/24.10.4/lantiq/xway_legacy/luci-proto-amneziawg_v24.10.4_mips_24kc_lantiq_xway_legacy.ipk)
