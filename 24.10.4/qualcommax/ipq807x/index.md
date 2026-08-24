---
layout: default
title: "OpenWrt 24.10.4 qualcommax/ipq807x"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.4](https://2grey.github.io/awg-openwrt/24.10.4/) / [qualcommax](https://2grey.github.io/awg-openwrt/24.10.4/qualcommax/)

- OpenWrt version: `24.10.4`
- Target: `qualcommax`
- Subtarget: `ipq807x`
- Package architecture: `aarch64_cortex-a53`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.4/targets/qualcommax/ipq807x/](https://downloads.openwrt.org/releases/24.10.4/targets/qualcommax/ipq807x/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.4/qualcommax/ipq807x" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.4/qualcommax/ipq807x/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.4/qualcommax/ipq807x/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.4/qualcommax/ipq807x/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.4/qualcommax/ipq807x/Packages.sig)
- [amneziawg-tools_v24.10.4_aarch64_cortex-a53_qualcommax_ipq807x.ipk](https://2grey.github.io/awg-openwrt/24.10.4/qualcommax/ipq807x/amneziawg-tools_v24.10.4_aarch64_cortex-a53_qualcommax_ipq807x.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.4/qualcommax/ipq807x/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.4/qualcommax/ipq807x/index.json)
- [kmod-amneziawg_v24.10.4_aarch64_cortex-a53_qualcommax_ipq807x.ipk](https://2grey.github.io/awg-openwrt/24.10.4/qualcommax/ipq807x/kmod-amneziawg_v24.10.4_aarch64_cortex-a53_qualcommax_ipq807x.ipk)
- [luci-i18n-amneziawg-ru_v24.10.4_aarch64_cortex-a53_qualcommax_ipq807x.ipk](https://2grey.github.io/awg-openwrt/24.10.4/qualcommax/ipq807x/luci-i18n-amneziawg-ru_v24.10.4_aarch64_cortex-a53_qualcommax_ipq807x.ipk)
- [luci-proto-amneziawg_v24.10.4_aarch64_cortex-a53_qualcommax_ipq807x.ipk](https://2grey.github.io/awg-openwrt/24.10.4/qualcommax/ipq807x/luci-proto-amneziawg_v24.10.4_aarch64_cortex-a53_qualcommax_ipq807x.ipk)
