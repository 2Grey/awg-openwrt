---
layout: default
title: "OpenWrt 24.10.8 mvebu/cortexa53"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.8](https://2grey.github.io/awg-openwrt/24.10.8/) / [mvebu](https://2grey.github.io/awg-openwrt/24.10.8/mvebu/)

- OpenWrt version: `24.10.8`
- Target: `mvebu`
- Subtarget: `cortexa53`
- Package architecture: `aarch64_cortex-a53`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.8/targets/mvebu/cortexa53/](https://downloads.openwrt.org/releases/24.10.8/targets/mvebu/cortexa53/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.8/mvebu/cortexa53" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.8/mvebu/cortexa53/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.8/mvebu/cortexa53/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.8/mvebu/cortexa53/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.8/mvebu/cortexa53/Packages.sig)
- [amneziawg-tools_v24.10.8_aarch64_cortex-a53_mvebu_cortexa53.ipk](https://2grey.github.io/awg-openwrt/24.10.8/mvebu/cortexa53/amneziawg-tools_v24.10.8_aarch64_cortex-a53_mvebu_cortexa53.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.8/mvebu/cortexa53/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.8/mvebu/cortexa53/index.json)
- [kmod-amneziawg_v24.10.8_aarch64_cortex-a53_mvebu_cortexa53.ipk](https://2grey.github.io/awg-openwrt/24.10.8/mvebu/cortexa53/kmod-amneziawg_v24.10.8_aarch64_cortex-a53_mvebu_cortexa53.ipk)
- [luci-i18n-amneziawg-ru_v24.10.8_aarch64_cortex-a53_mvebu_cortexa53.ipk](https://2grey.github.io/awg-openwrt/24.10.8/mvebu/cortexa53/luci-i18n-amneziawg-ru_v24.10.8_aarch64_cortex-a53_mvebu_cortexa53.ipk)
- [luci-proto-amneziawg_v24.10.8_aarch64_cortex-a53_mvebu_cortexa53.ipk](https://2grey.github.io/awg-openwrt/24.10.8/mvebu/cortexa53/luci-proto-amneziawg_v24.10.8_aarch64_cortex-a53_mvebu_cortexa53.ipk)
