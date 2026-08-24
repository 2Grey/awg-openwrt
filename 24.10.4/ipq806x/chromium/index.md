---
layout: default
title: "OpenWrt 24.10.4 ipq806x/chromium"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.4](https://2grey.github.io/awg-openwrt/24.10.4/) / [ipq806x](https://2grey.github.io/awg-openwrt/24.10.4/ipq806x/)

- OpenWrt version: `24.10.4`
- Target: `ipq806x`
- Subtarget: `chromium`
- Package architecture: `arm_cortex-a15_neon-vfpv4`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.4/targets/ipq806x/chromium/](https://downloads.openwrt.org/releases/24.10.4/targets/ipq806x/chromium/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.4/ipq806x/chromium" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.4/ipq806x/chromium/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.4/ipq806x/chromium/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.4/ipq806x/chromium/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.4/ipq806x/chromium/Packages.sig)
- [amneziawg-tools_v24.10.4_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.ipk](https://2grey.github.io/awg-openwrt/24.10.4/ipq806x/chromium/amneziawg-tools_v24.10.4_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.4/ipq806x/chromium/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.4/ipq806x/chromium/index.json)
- [kmod-amneziawg_v24.10.4_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.ipk](https://2grey.github.io/awg-openwrt/24.10.4/ipq806x/chromium/kmod-amneziawg_v24.10.4_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.ipk)
- [luci-i18n-amneziawg-ru_v24.10.4_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.ipk](https://2grey.github.io/awg-openwrt/24.10.4/ipq806x/chromium/luci-i18n-amneziawg-ru_v24.10.4_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.ipk)
- [luci-proto-amneziawg_v24.10.4_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.ipk](https://2grey.github.io/awg-openwrt/24.10.4/ipq806x/chromium/luci-proto-amneziawg_v24.10.4_arm_cortex-a15_neon-vfpv4_ipq806x_chromium.ipk)
