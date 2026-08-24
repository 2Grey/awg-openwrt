---
layout: default
title: "OpenWrt 24.10.4 imx/cortexa9"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.4](https://2grey.github.io/awg-openwrt/24.10.4/) / [imx](https://2grey.github.io/awg-openwrt/24.10.4/imx/)

- OpenWrt version: `24.10.4`
- Target: `imx`
- Subtarget: `cortexa9`
- Package architecture: `arm_cortex-a9_neon`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.4/targets/imx/cortexa9/](https://downloads.openwrt.org/releases/24.10.4/targets/imx/cortexa9/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.4/imx/cortexa9" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.4/imx/cortexa9/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.4/imx/cortexa9/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.4/imx/cortexa9/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.4/imx/cortexa9/Packages.sig)
- [amneziawg-tools_v24.10.4_arm_cortex-a9_neon_imx_cortexa9.ipk](https://2grey.github.io/awg-openwrt/24.10.4/imx/cortexa9/amneziawg-tools_v24.10.4_arm_cortex-a9_neon_imx_cortexa9.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.4/imx/cortexa9/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.4/imx/cortexa9/index.json)
- [kmod-amneziawg_v24.10.4_arm_cortex-a9_neon_imx_cortexa9.ipk](https://2grey.github.io/awg-openwrt/24.10.4/imx/cortexa9/kmod-amneziawg_v24.10.4_arm_cortex-a9_neon_imx_cortexa9.ipk)
- [luci-i18n-amneziawg-ru_v24.10.4_arm_cortex-a9_neon_imx_cortexa9.ipk](https://2grey.github.io/awg-openwrt/24.10.4/imx/cortexa9/luci-i18n-amneziawg-ru_v24.10.4_arm_cortex-a9_neon_imx_cortexa9.ipk)
- [luci-proto-amneziawg_v24.10.4_arm_cortex-a9_neon_imx_cortexa9.ipk](https://2grey.github.io/awg-openwrt/24.10.4/imx/cortexa9/luci-proto-amneziawg_v24.10.4_arm_cortex-a9_neon_imx_cortexa9.ipk)
