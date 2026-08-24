---
layout: default
title: "OpenWrt 24.10.8 malta/le"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.8](https://2grey.github.io/awg-openwrt/24.10.8/) / [malta](https://2grey.github.io/awg-openwrt/24.10.8/malta/)

- OpenWrt version: `24.10.8`
- Target: `malta`
- Subtarget: `le`
- Package architecture: `mipsel_24kc`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.8/targets/malta/le/](https://downloads.openwrt.org/releases/24.10.8/targets/malta/le/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.8/malta/le" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.8/malta/le/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.8/malta/le/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.8/malta/le/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.8/malta/le/Packages.sig)
- [amneziawg-tools_v24.10.8_mipsel_24kc_malta_le.ipk](https://2grey.github.io/awg-openwrt/24.10.8/malta/le/amneziawg-tools_v24.10.8_mipsel_24kc_malta_le.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.8/malta/le/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.8/malta/le/index.json)
- [kmod-amneziawg_v24.10.8_mipsel_24kc_malta_le.ipk](https://2grey.github.io/awg-openwrt/24.10.8/malta/le/kmod-amneziawg_v24.10.8_mipsel_24kc_malta_le.ipk)
- [luci-i18n-amneziawg-ru_v24.10.8_mipsel_24kc_malta_le.ipk](https://2grey.github.io/awg-openwrt/24.10.8/malta/le/luci-i18n-amneziawg-ru_v24.10.8_mipsel_24kc_malta_le.ipk)
- [luci-proto-amneziawg_v24.10.8_mipsel_24kc_malta_le.ipk](https://2grey.github.io/awg-openwrt/24.10.8/malta/le/luci-proto-amneziawg_v24.10.8_mipsel_24kc_malta_le.ipk)
