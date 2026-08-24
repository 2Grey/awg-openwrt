---
layout: default
title: "OpenWrt 24.10.5 bcm4908/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.5](https://2grey.github.io/awg-openwrt/24.10.5/) / [bcm4908](https://2grey.github.io/awg-openwrt/24.10.5/bcm4908/)

- OpenWrt version: `24.10.5`
- Target: `bcm4908`
- Subtarget: `generic`
- Package architecture: `aarch64_cortex-a53`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.5/targets/bcm4908/generic/](https://downloads.openwrt.org/releases/24.10.5/targets/bcm4908/generic/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.5/bcm4908/generic" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.5/bcm4908/generic/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.5/bcm4908/generic/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.5/bcm4908/generic/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.5/bcm4908/generic/Packages.sig)
- [amneziawg-tools_v24.10.5_aarch64_cortex-a53_bcm4908_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.5/bcm4908/generic/amneziawg-tools_v24.10.5_aarch64_cortex-a53_bcm4908_generic.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.5/bcm4908/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.5/bcm4908/generic/index.json)
- [kmod-amneziawg_v24.10.5_aarch64_cortex-a53_bcm4908_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.5/bcm4908/generic/kmod-amneziawg_v24.10.5_aarch64_cortex-a53_bcm4908_generic.ipk)
- [luci-i18n-amneziawg-ru_v24.10.5_aarch64_cortex-a53_bcm4908_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.5/bcm4908/generic/luci-i18n-amneziawg-ru_v24.10.5_aarch64_cortex-a53_bcm4908_generic.ipk)
- [luci-proto-amneziawg_v24.10.5_aarch64_cortex-a53_bcm4908_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.5/bcm4908/generic/luci-proto-amneziawg_v24.10.5_aarch64_cortex-a53_bcm4908_generic.ipk)
