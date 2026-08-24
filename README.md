![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/2grey/awg-openwrt/total?style=for-the-badge&link=https%3A%2F%2Fgithub.com%2F2Grey%2Fawg-openwrt%2Freleases)

# AmneziAWG packages for routers running OpenWRT

## Custom package feed (GitHub Pages)

The repository also publishes a full-featured [OpenWRT package feed](https://2grey.github.io/awg-openwrt/)
with signed IPK repositories for OpenWrt 24.x and signed APK repositories for
OpenWrt 25.x and later.

[Detailed documentation](docs/custom-feed.md)

Install the packages from the signed feed (the exact OpenWrt version and target
are detected automatically):

```sh
sh <(wget -O - https://raw.githubusercontent.com/2Grey/awg-openwrt/refs/heads/master/amneziawg-feed-install.sh)
```

Add `-r` to also install the Russian LuCI translation.

## AWG 3.1 Support

The `master` branch contains an aligned set of AWG 3.1 components:

- `kmod-amneziawg` — `v3.1.20260812`;
- `amneziawg-tools` — `v3.1.20260812`;
- `luci-proto-amneziawg` — Web interface and import/export of AWG 3.1 configurations.

The netifd and LuCI support `HeaderProtectionKey`, `ContentPaddingAddition`,
`RekeyAfterTime`, `RekeyTimeout`, `RejectAfterTime`, `KeepaliveTimeout`,
`MaxHandshakeAttempts`, `RandomTrailers`, `DisableCookies`, the `H1-H4`
ranges, and the `PersistentKeepalive` range.

`RandomTrailers` and `DisableCookies` accept `on` or `off`. `RandomTrailers`
must have the same value on both sides. A 3.1 implementation remains compatible
with existing AWG 3.0 configurations when both new settings are absent or off.

Ranges are specified as `lower-upper` (for example, `20-30`) or as a single number.  
When using `HeaderProtectionKey`, the `S1-S4` parameters must be at least 12.

## Automatic configuration of AmneziaWG for OpenWRT version 24.10.4 ~ 25.12.5

The `master` branch builds an aligned AWG 3.1 stack: `kmod-amneziawg`
`v3.1.20260812`, `amneziawg-tools` `v3.1.20260812`, and an AWG 3.1-aware
LuCI/netifd integration.

The UI and configuration import/export support
`HeaderProtectionKey`, `ContentPaddingAddition`, customizable timing ranges,
`RandomTrailers`, `DisableCookies`, `H1-H4` ranges, and
`PersistentKeepalive` ranges.

A range is written as
`lower-upper` (for example, `20-30`). When header protection is enabled, each
of `S1-S4` must be at least 12.

1. If your router has enough available ROM, I recommend using the script described below only to install the necessary packages, and use podkop from user [@itdoginfo](https://github.com/itdoginfo) for selective traffic routing into the tunnel - the setup process is described in the [documentation](https://podkop.net/docs/tunnels/awg_settings/)

2. If you only need to install packages, I added the amneziawg-install script - it will automatically download packages from this repository for your device (only for the stable version of OpenWRT), and also offer to immediately configure the interface with the AmneziaWG protocol.  
If the user agrees, you will need to enter the config parameters that the script will request.  
The script will create an interface, configure firewall rules for it, and also **enable redirection of all traffic through the AmneziaWG tunnel** (check the Route Allowed IPs box in the Peer settings).  
To run the script, connect to the router via SSH, enter the command and follow the instructions on the screen:

```sh
sh <(wget -O - https://raw.githubusercontent.com/2Grey/awg-openwrt/refs/heads/master/amneziawg-install.sh)
```

3. There is also a non-interactive mode for simple package installation (without questions about configuring an interface with the AmneziaWG protocol and installing the `luci-i18n-amneziawg-ru` package):

```sh
sh <(wget -O - https://raw.githubusercontent.com/2Grey/awg-openwrt/refs/heads/master/amneziawg-install.sh) -en
```

The installer can configure AWG 2.0, 3.0, and 3.1 connection profiles. A ready
AmneziaWG configuration with one `[Peer]` section can be imported directly;
`auto` detects the minimum required profile:

```sh
sh amneziawg-install.sh -e -a auto -c /root/client.conf
```

To enter settings interactively and force a particular compatibility profile:

```sh
sh amneziawg-install.sh -a 2.0
sh amneziawg-install.sh -a 3.0
sh amneziawg-install.sh -a 3.1
```

The script verifies the version reported by the installed `amneziawg-tools`
and refuses to configure a newer profile on older release assets. If an older
kernel module is still loaded after an upgrade, reboot the router and run the
script again.
4. In addition, for automatic configuration you can also use the [script](https://github.com/itdoginfo/domain-routing-openwrt) from user [@itdoginfo](https://github.com/itdoginfo).  
This script allows you to automatically download the necessary packages from those collected here and configure [point-by-point bypass of blocking by domains](https://habr.com/ru/articles/767464/) (instructions in Russian).  
Suitable if you have a weak router with insufficient ROM to install podkop and its dependencies

# Building packages for all devices that support OpenWRT

A script has been added to the repository that parses data on supported platforms from the OpenWRT page and automatically starts building AmneziaWG packages for all devices.
At the moment I have collected packages for all devices for OpenWRT versions:

1. [25.12.5](https://github.com/2Grey/awg-openwrt/releases/tag/v25.12.5) – AWG-3.1
2. [25.12.4](https://github.com/2Grey/awg-openwrt/releases/tag/v25.12.4) – AWG-3.1
3. [25.12.3](https://github.com/2Grey/awg-openwrt/releases/tag/v25.12.3) – AWG-3.1
4. [25.12.2](https://github.com/2Grey/awg-openwrt/releases/tag/v25.12.2) – AWG-3.1
5. [25.12.1](https://github.com/2Grey/awg-openwrt/releases/tag/v25.12.1) – AWG-3.1
6. [25.12.0](https://github.com/2Grey/awg-openwrt/releases/tag/v25.12.0) – AWG-3.1
7. [24.10.8](https://github.com/2Grey/awg-openwrt/releases/tag/v24.10.8) – AWG-3.1
8. [24.10.7](https://github.com/2Grey/awg-openwrt/releases/tag/v24.10.7) – AWG-3.1
9. [24.10.6](https://github.com/2Grey/awg-openwrt/releases/tag/v24.10.6) – AWG-3.1
10. [24.10.5](https://github.com/2Grey/awg-openwrt/releases/tag/v24.10.5) – AWG-3.1
11. [24.10.4](https://github.com/2Grey/awg-openwrt/releases/tag/v24.10.4) – AWG-3.1

For builds for older versions of OpenWRT, see the [Slava-Shchipunov](https://github.com/Slava-Shchipunov/awg-openwrt) repository.

## Selecting packages for your device

In accordance with the paragraph [Specify variables for builds](https://github.com/itdoginfo/domain-routing-openwrt/wiki/Amnezia-WG-Build#%D1%83%D0%BA%D0%B0%D0%B7%D1%8B%D0%B2%D0%B0%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5-%D0%B4%D0%BB%D1%8F-%D1%81%D0%B1%D0%BE%D1%80%D0%BA%D0%B8) (instructions in Russian) determine `target` and `subtarget` of your device.  
Then go to the release page corresponding to your OpenWRT version, then search the page (Ctrl+F) to find 3 packages whose names end in `target_subtarget.ipk` corresponding to your device.  
For AWG 2.0, 3.0, and 3.1, the Russian localization package luci-i18n-amneziawg-ru is also available

## How to run a build for all supported devices

1. Create a fork of this repository
2. Switch to the Actions tab and enable Github actions (they are disabled for forks by default)
3. Then go to the Code tab => Releases (on the right side of the screen) => Draft a new release
4. Click Choose a tag and create a new tag in the vX.X.X format, where you need to substitute the required OpenWRT version for X.X.X, for example, v23.05.4
5. Select the `master` branch as the target
6. Enter Release title
7. Click the green Publish release button at the bottom

For public repositories, Github provides unlimited use of runners, I had up to 20 parallel jobs running. Each job takes about 10-15 minutes, the total build time is about 60 minutes.

## Building packages for a specific platform

You can see how to start building AWG 1.0 packages for a specific platform in the [wiki instructions](https://github.com/itdoginfo/domain-routing-openwrt/wiki/Amnezia-WG-Build) (instructions in Russian). Building for one device will take about 2 hours.

AWG 2.0, 3.0, and 3.1 can be built for a specific platform as follows:

1. Create a fork of this repository
2. Switch to the Actions tab and enable Github actions (they are disabled for forks by default)
3. On the left in the list of actions, select the Create Release on Tag action
4. On the right, click the Run workflow button
5. In the opened list, specify the OpenWRT version (for example, 24.10.3), a list of targets separated by commas (for example, stm32,ramips), a list of subtargets separated by commas (for example, stm32mp1,mt7621). The build will be performed only for existing target/subtarget pairs
6. Click the green Run workflow button
   Building for one device will take about 10-15 minutes. A release with the specified OpenWRT version should be created
