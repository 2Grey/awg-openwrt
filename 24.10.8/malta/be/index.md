---
layout: default
title: "OpenWrt 24.10.8 malta/be"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.8](https://2grey.github.io/awg-openwrt/24.10.8/) / [malta](https://2grey.github.io/awg-openwrt/24.10.8/malta/)

- OpenWrt version: `24.10.8`
- Target: `malta`
- Subtarget: `be`
- Package architecture: `mips_24kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.8/targets/malta/be/](https://downloads.openwrt.org/releases/24.10.8/targets/malta/be/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.8/malta/be" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.8/malta/be/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.8/malta/be/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.8/malta/be/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.8/malta/be/Packages.sig)
- [amneziawg-tools_v24.10.8_mips_24kc_malta_be.ipk](https://2grey.github.io/awg-openwrt/24.10.8/malta/be/amneziawg-tools_v24.10.8_mips_24kc_malta_be.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.8/malta/be/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.8/malta/be/index.json)
- [kmod-amneziawg_v24.10.8_mips_24kc_malta_be.ipk](https://2grey.github.io/awg-openwrt/24.10.8/malta/be/kmod-amneziawg_v24.10.8_mips_24kc_malta_be.ipk)
- [luci-i18n-amneziawg-ru_v24.10.8_mips_24kc_malta_be.ipk](https://2grey.github.io/awg-openwrt/24.10.8/malta/be/luci-i18n-amneziawg-ru_v24.10.8_mips_24kc_malta_be.ipk)
- [luci-proto-amneziawg_v24.10.8_mips_24kc_malta_be.ipk](https://2grey.github.io/awg-openwrt/24.10.8/malta/be/luci-proto-amneziawg_v24.10.8_mips_24kc_malta_be.ipk)
