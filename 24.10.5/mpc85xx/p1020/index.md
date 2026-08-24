---
layout: default
title: "OpenWrt 24.10.5 mpc85xx/p1020"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.5](https://2grey.github.io/awg-openwrt/24.10.5/) / [mpc85xx](https://2grey.github.io/awg-openwrt/24.10.5/mpc85xx/)

- OpenWrt version: `24.10.5`
- Target: `mpc85xx`
- Subtarget: `p1020`
- Package architecture: `powerpc_8548`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.5/targets/mpc85xx/p1020/](https://downloads.openwrt.org/releases/24.10.5/targets/mpc85xx/p1020/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.5/mpc85xx/p1020" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.5/mpc85xx/p1020/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.5/mpc85xx/p1020/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.5/mpc85xx/p1020/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.5/mpc85xx/p1020/Packages.sig)
- [amneziawg-tools_v24.10.5_powerpc_8548_mpc85xx_p1020.ipk](https://2grey.github.io/awg-openwrt/24.10.5/mpc85xx/p1020/amneziawg-tools_v24.10.5_powerpc_8548_mpc85xx_p1020.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.5/mpc85xx/p1020/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.5/mpc85xx/p1020/index.json)
- [kmod-amneziawg_v24.10.5_powerpc_8548_mpc85xx_p1020.ipk](https://2grey.github.io/awg-openwrt/24.10.5/mpc85xx/p1020/kmod-amneziawg_v24.10.5_powerpc_8548_mpc85xx_p1020.ipk)
- [luci-i18n-amneziawg-ru_v24.10.5_powerpc_8548_mpc85xx_p1020.ipk](https://2grey.github.io/awg-openwrt/24.10.5/mpc85xx/p1020/luci-i18n-amneziawg-ru_v24.10.5_powerpc_8548_mpc85xx_p1020.ipk)
- [luci-proto-amneziawg_v24.10.5_powerpc_8548_mpc85xx_p1020.ipk](https://2grey.github.io/awg-openwrt/24.10.5/mpc85xx/p1020/luci-proto-amneziawg_v24.10.5_powerpc_8548_mpc85xx_p1020.ipk)
