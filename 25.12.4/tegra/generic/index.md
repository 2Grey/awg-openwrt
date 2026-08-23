---
layout: default
title: "OpenWrt 25.12.4 tegra/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [25.12.4](https://2grey.github.io/awg-openwrt/25.12.4/) / [tegra](https://2grey.github.io/awg-openwrt/25.12.4/tegra/)

- OpenWrt version: `25.12.4`
- Target: `tegra`
- Subtarget: `generic`
- Package architecture: `arm_cortex-a9_vfpv3-d16`
- Package format: `apk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/25.12.4/targets/tegra/generic/](https://downloads.openwrt.org/releases/25.12.4/targets/tegra/generic/)


## Configure Feed

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem"
echo "https://2grey.github.io/awg-openwrt/25.12.4/tegra/generic/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
```

## Install Packages

```sh
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [amneziawg-tools-3.0.20260805-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/tegra/generic/amneziawg-tools-3.0.20260805-r1.apk)
- [amneziawg-tools_v25.12.4_arm_cortex-a9_vfpv3-d16_tegra_generic.apk](https://2grey.github.io/awg-openwrt/25.12.4/tegra/generic/amneziawg-tools_v25.12.4_arm_cortex-a9_vfpv3-d16_tegra_generic.apk)
- [feed.json](https://2grey.github.io/awg-openwrt/25.12.4/tegra/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/25.12.4/tegra/generic/index.json)
- [kmod-amneziawg-6.12.87.3.0.20260731-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/tegra/generic/kmod-amneziawg-6.12.87.3.0.20260731-r1.apk)
- [kmod-amneziawg_v25.12.4_arm_cortex-a9_vfpv3-d16_tegra_generic.apk](https://2grey.github.io/awg-openwrt/25.12.4/tegra/generic/kmod-amneziawg_v25.12.4_arm_cortex-a9_vfpv3-d16_tegra_generic.apk)
- [luci-i18n-amneziawg-ru-0.260807.39701.apk](https://2grey.github.io/awg-openwrt/25.12.4/tegra/generic/luci-i18n-amneziawg-ru-0.260807.39701.apk)
- [luci-i18n-amneziawg-ru_v25.12.4_arm_cortex-a9_vfpv3-d16_tegra_generic.apk](https://2grey.github.io/awg-openwrt/25.12.4/tegra/generic/luci-i18n-amneziawg-ru_v25.12.4_arm_cortex-a9_vfpv3-d16_tegra_generic.apk)
- [luci-proto-amneziawg-3.0.0-r1.apk](https://2grey.github.io/awg-openwrt/25.12.4/tegra/generic/luci-proto-amneziawg-3.0.0-r1.apk)
- [luci-proto-amneziawg_v25.12.4_arm_cortex-a9_vfpv3-d16_tegra_generic.apk](https://2grey.github.io/awg-openwrt/25.12.4/tegra/generic/luci-proto-amneziawg_v25.12.4_arm_cortex-a9_vfpv3-d16_tegra_generic.apk)
- [packages.adb](https://2grey.github.io/awg-openwrt/25.12.4/tegra/generic/packages.adb)
