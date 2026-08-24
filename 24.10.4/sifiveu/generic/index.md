---
layout: default
title: "OpenWrt 24.10.4 sifiveu/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.4](https://2grey.github.io/awg-openwrt/24.10.4/) / [sifiveu](https://2grey.github.io/awg-openwrt/24.10.4/sifiveu/)

- OpenWrt version: `24.10.4`
- Target: `sifiveu`
- Subtarget: `generic`
- Package architecture: `riscv64_riscv64`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.4/targets/sifiveu/generic/](https://downloads.openwrt.org/releases/24.10.4/targets/sifiveu/generic/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.4/sifiveu/generic" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.4/sifiveu/generic/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.4/sifiveu/generic/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.4/sifiveu/generic/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.4/sifiveu/generic/Packages.sig)
- [amneziawg-tools_v24.10.4_riscv64_riscv64_sifiveu_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.4/sifiveu/generic/amneziawg-tools_v24.10.4_riscv64_riscv64_sifiveu_generic.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.4/sifiveu/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.4/sifiveu/generic/index.json)
- [kmod-amneziawg_v24.10.4_riscv64_riscv64_sifiveu_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.4/sifiveu/generic/kmod-amneziawg_v24.10.4_riscv64_riscv64_sifiveu_generic.ipk)
- [luci-i18n-amneziawg-ru_v24.10.4_riscv64_riscv64_sifiveu_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.4/sifiveu/generic/luci-i18n-amneziawg-ru_v24.10.4_riscv64_riscv64_sifiveu_generic.ipk)
- [luci-proto-amneziawg_v24.10.4_riscv64_riscv64_sifiveu_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.4/sifiveu/generic/luci-proto-amneziawg_v24.10.4_riscv64_riscv64_sifiveu_generic.ipk)
