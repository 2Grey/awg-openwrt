---
layout: default
title: "OpenWrt 24.10.4 mpc85xx/p1010"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.4](https://2grey.github.io/awg-openwrt/24.10.4/) / [mpc85xx](https://2grey.github.io/awg-openwrt/24.10.4/mpc85xx/)

- OpenWrt version: `24.10.4`
- Target: `mpc85xx`
- Subtarget: `p1010`
- Package architecture: `powerpc_8548`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.4/targets/mpc85xx/p1010/](https://downloads.openwrt.org/releases/24.10.4/targets/mpc85xx/p1010/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.4/mpc85xx/p1010" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.4/mpc85xx/p1010/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.4/mpc85xx/p1010/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.4/mpc85xx/p1010/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.4/mpc85xx/p1010/Packages.sig)
- [amneziawg-tools_v24.10.4_powerpc_8548_mpc85xx_p1010.ipk](https://2grey.github.io/awg-openwrt/24.10.4/mpc85xx/p1010/amneziawg-tools_v24.10.4_powerpc_8548_mpc85xx_p1010.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.4/mpc85xx/p1010/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.4/mpc85xx/p1010/index.json)
- [kmod-amneziawg_v24.10.4_powerpc_8548_mpc85xx_p1010.ipk](https://2grey.github.io/awg-openwrt/24.10.4/mpc85xx/p1010/kmod-amneziawg_v24.10.4_powerpc_8548_mpc85xx_p1010.ipk)
- [luci-i18n-amneziawg-ru_v24.10.4_powerpc_8548_mpc85xx_p1010.ipk](https://2grey.github.io/awg-openwrt/24.10.4/mpc85xx/p1010/luci-i18n-amneziawg-ru_v24.10.4_powerpc_8548_mpc85xx_p1010.ipk)
- [luci-proto-amneziawg_v24.10.4_powerpc_8548_mpc85xx_p1010.ipk](https://2grey.github.io/awg-openwrt/24.10.4/mpc85xx/p1010/luci-proto-amneziawg_v24.10.4_powerpc_8548_mpc85xx_p1010.ipk)
