---
layout: default
title: "OpenWrt 24.10.8 d1/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.8](https://2grey.github.io/awg-openwrt/24.10.8/) / [d1](https://2grey.github.io/awg-openwrt/24.10.8/d1/)

- OpenWrt version: `24.10.8`
- Target: `d1`
- Subtarget: `generic`
- Package architecture: `riscv64_riscv64`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.8/targets/d1/generic/](https://downloads.openwrt.org/releases/24.10.8/targets/d1/generic/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.8/d1/generic" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.8/d1/generic/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.8/d1/generic/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.8/d1/generic/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.8/d1/generic/Packages.sig)
- [amneziawg-tools_v24.10.8_riscv64_riscv64_d1_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.8/d1/generic/amneziawg-tools_v24.10.8_riscv64_riscv64_d1_generic.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.8/d1/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.8/d1/generic/index.json)
- [kmod-amneziawg_v24.10.8_riscv64_riscv64_d1_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.8/d1/generic/kmod-amneziawg_v24.10.8_riscv64_riscv64_d1_generic.ipk)
- [luci-i18n-amneziawg-ru_v24.10.8_riscv64_riscv64_d1_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.8/d1/generic/luci-i18n-amneziawg-ru_v24.10.8_riscv64_riscv64_d1_generic.ipk)
- [luci-proto-amneziawg_v24.10.8_riscv64_riscv64_d1_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.8/d1/generic/luci-proto-amneziawg_v24.10.8_riscv64_riscv64_d1_generic.ipk)
