---
layout: default
title: "OpenWrt 24.10.7 at91/sam9x"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.7](https://2grey.github.io/awg-openwrt/24.10.7/) / [at91](https://2grey.github.io/awg-openwrt/24.10.7/at91/)

- OpenWrt version: `24.10.7`
- Target: `at91`
- Subtarget: `sam9x`
- Package architecture: `arm_arm926ej-s`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.7/targets/at91/sam9x/](https://downloads.openwrt.org/releases/24.10.7/targets/at91/sam9x/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.7/at91/sam9x" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.7/at91/sam9x/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.7/at91/sam9x/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.7/at91/sam9x/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.7/at91/sam9x/Packages.sig)
- [amneziawg-tools_v24.10.7_arm_arm926ej-s_at91_sam9x.ipk](https://2grey.github.io/awg-openwrt/24.10.7/at91/sam9x/amneziawg-tools_v24.10.7_arm_arm926ej-s_at91_sam9x.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.7/at91/sam9x/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.7/at91/sam9x/index.json)
- [kmod-amneziawg_v24.10.7_arm_arm926ej-s_at91_sam9x.ipk](https://2grey.github.io/awg-openwrt/24.10.7/at91/sam9x/kmod-amneziawg_v24.10.7_arm_arm926ej-s_at91_sam9x.ipk)
- [luci-i18n-amneziawg-ru_v24.10.7_arm_arm926ej-s_at91_sam9x.ipk](https://2grey.github.io/awg-openwrt/24.10.7/at91/sam9x/luci-i18n-amneziawg-ru_v24.10.7_arm_arm926ej-s_at91_sam9x.ipk)
- [luci-proto-amneziawg_v24.10.7_arm_arm926ej-s_at91_sam9x.ipk](https://2grey.github.io/awg-openwrt/24.10.7/at91/sam9x/luci-proto-amneziawg_v24.10.7_arm_arm926ej-s_at91_sam9x.ipk)
