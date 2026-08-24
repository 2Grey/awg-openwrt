---
layout: default
title: "OpenWrt 24.10.6 gemini/generic"
---

# AmneziaWG feed

Index of [(root)](https://2grey.github.io/awg-openwrt/) / [24.10.6](https://2grey.github.io/awg-openwrt/24.10.6/) / [gemini](https://2grey.github.io/awg-openwrt/24.10.6/gemini/)

- OpenWrt version: `24.10.6`
- Target: `gemini`
- Subtarget: `generic`
- Package architecture: `arm_fa526`
- Package format: `ipk`

## Upstream OpenWrt target

[https://downloads.openwrt.org/releases/24.10.6/targets/gemini/generic/](https://downloads.openwrt.org/releases/24.10.6/targets/gemini/generic/)


## Configure Feed

```sh
wget -O /tmp/awg-openwrt-feed.pub "https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub"
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
echo "src/gz awg https://2grey.github.io/awg-openwrt/24.10.6/gemini/generic" >> /etc/opkg/customfeeds.conf
```

## Install Packages

```sh
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```


<script src="https://2grey.github.io/awg-openwrt/assets/copy-code.js?v=2"></script>

## Feed files

- [Packages](https://2grey.github.io/awg-openwrt/24.10.6/gemini/generic/Packages)
- [Packages.gz](https://2grey.github.io/awg-openwrt/24.10.6/gemini/generic/Packages.gz)
- [Packages.manifest](https://2grey.github.io/awg-openwrt/24.10.6/gemini/generic/Packages.manifest)
- [Packages.sig](https://2grey.github.io/awg-openwrt/24.10.6/gemini/generic/Packages.sig)
- [amneziawg-tools_v24.10.6_arm_fa526_gemini_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.6/gemini/generic/amneziawg-tools_v24.10.6_arm_fa526_gemini_generic.ipk)
- [feed.json](https://2grey.github.io/awg-openwrt/24.10.6/gemini/generic/feed.json)
- [index.json](https://2grey.github.io/awg-openwrt/24.10.6/gemini/generic/index.json)
- [kmod-amneziawg_v24.10.6_arm_fa526_gemini_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.6/gemini/generic/kmod-amneziawg_v24.10.6_arm_fa526_gemini_generic.ipk)
- [luci-i18n-amneziawg-ru_v24.10.6_arm_fa526_gemini_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.6/gemini/generic/luci-i18n-amneziawg-ru_v24.10.6_arm_fa526_gemini_generic.ipk)
- [luci-proto-amneziawg_v24.10.6_arm_fa526_gemini_generic.ipk](https://2grey.github.io/awg-openwrt/24.10.6/gemini/generic/luci-proto-amneziawg_v24.10.6_arm_fa526_gemini_generic.ipk)
