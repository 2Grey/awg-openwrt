---
layout: default
title: "OpenWrt 24.10.3 layerscape/armv8_64b"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.3](https://2grey.github.io/awg-openwrt/24.10.3/) / [layerscape](https://2grey.github.io/awg-openwrt/24.10.3/layerscape/)

- OpenWrt version: `24.10.3`
- Target: `layerscape`
- Subtarget: `armv8_64b`
- Package architecture: `aarch64_generic`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.3/targets/layerscape/armv8_64b/](https://downloads.openwrt.org/releases/24.10.3/targets/layerscape/armv8_64b/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.3/layerscape/armv8_64b" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.3/layerscape/armv8_64b/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.3/layerscape/armv8_64b/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.3/layerscape/armv8_64b/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.3/layerscape/armv8_64b/Packages.sig)
- [amneziawg-tools_v24.10.3_aarch64_generic_layerscape_armv8_64b.ipk](https://2grey.github.io/awg-openwrt/24.10.3/layerscape/armv8_64b/amneziawg-tools_v24.10.3_aarch64_generic_layerscape_armv8_64b.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.3/layerscape/armv8_64b/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.3/layerscape/armv8_64b/index.json)
- [kmod-amneziawg_v24.10.3_aarch64_generic_layerscape_armv8_64b.ipk](https://2grey.github.io/awg-openwrt/24.10.3/layerscape/armv8_64b/kmod-amneziawg_v24.10.3_aarch64_generic_layerscape_armv8_64b.ipk)
- [luci-i18n-amneziawg-ru_v24.10.3_aarch64_generic_layerscape_armv8_64b.ipk](https://2grey.github.io/awg-openwrt/24.10.3/layerscape/armv8_64b/luci-i18n-amneziawg-ru_v24.10.3_aarch64_generic_layerscape_armv8_64b.ipk)
- [luci-proto-amneziawg_v24.10.3_aarch64_generic_layerscape_armv8_64b.ipk](https://2grey.github.io/awg-openwrt/24.10.3/layerscape/armv8_64b/luci-proto-amneziawg_v24.10.3_aarch64_generic_layerscape_armv8_64b.ipk)
