---
layout: default
title: "OpenWrt 24.10.8 bcm47xx/legacy"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.8](https://2grey.github.io/awg-openwrt/24.10.8/) / [bcm47xx](https://2grey.github.io/awg-openwrt/24.10.8/bcm47xx/)

- OpenWrt version: `24.10.8`
- Target: `bcm47xx`
- Subtarget: `legacy`
- Package architecture: `mipsel_mips32`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.8/targets/bcm47xx/legacy/](https://downloads.openwrt.org/releases/24.10.8/targets/bcm47xx/legacy/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.8/bcm47xx/legacy" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.8/bcm47xx/legacy/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.8/bcm47xx/legacy/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.8/bcm47xx/legacy/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.8/bcm47xx/legacy/Packages.sig)
- [amneziawg-tools_v24.10.8_mipsel_mips32_bcm47xx_legacy.ipk](https://2grey.github.io/awg-openwrt/24.10.8/bcm47xx/legacy/amneziawg-tools_v24.10.8_mipsel_mips32_bcm47xx_legacy.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.8/bcm47xx/legacy/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.8/bcm47xx/legacy/index.json)
- [kmod-amneziawg_v24.10.8_mipsel_mips32_bcm47xx_legacy.ipk](https://2grey.github.io/awg-openwrt/24.10.8/bcm47xx/legacy/kmod-amneziawg_v24.10.8_mipsel_mips32_bcm47xx_legacy.ipk)
- [luci-i18n-amneziawg-ru_v24.10.8_mipsel_mips32_bcm47xx_legacy.ipk](https://2grey.github.io/awg-openwrt/24.10.8/bcm47xx/legacy/luci-i18n-amneziawg-ru_v24.10.8_mipsel_mips32_bcm47xx_legacy.ipk)
- [luci-proto-amneziawg_v24.10.8_mipsel_mips32_bcm47xx_legacy.ipk](https://2grey.github.io/awg-openwrt/24.10.8/bcm47xx/legacy/luci-proto-amneziawg_v24.10.8_mipsel_mips32_bcm47xx_legacy.ipk)
