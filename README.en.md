# AmneziaWG packages for routers running OpenWrt

English | [Russian](README.md)

![AmneziaWG2.0](https://img.shields.io/badge/AmneziaWG-2.0-green)
![AmneziaWG3.0](https://img.shields.io/badge/AmneziaWG-3.0-orange)
![AmneziaWG3.1](https://img.shields.io/badge/AmneziaWG-3.1-red)

![OpenWrt 24](https://img.shields.io/badge/OpenWrt-24.10.4_~_24.10.8-blue)
![OpenWrt 25](https://img.shields.io/badge/OpenWrt-25.12.0_~_25.12.5-teal)

## AWG 3.1 Support

The `master` branch contains an aligned set of AWG 3.1 components:

- `kmod-amneziawg` — `v3.1.20260828`;
- `amneziawg-tools` — `v3.1.20260812`;
- `luci-proto-amneziawg` — `v3.1.0` — Web interface and import/export of AWG 3.1 configurations.

The netifd and LuCI support `HeaderProtectionKey`, `ContentPaddingAddition`,
`RekeyAfterTime`, `RekeyTimeout`, `RejectAfterTime`, `KeepaliveTimeout`,
`MaxHandshakeAttempts`, `RandomTrailers`, `DisableCookies`, the `H1-H4`
ranges, and the `PersistentKeepalive` range.

`RandomTrailers` and `DisableCookies` accept `on` or `off`. `RandomTrailers`
must have the same value on both sides. A 3.1 implementation remains compatible
with existing AWG 3.0 configurations when both new settings are absent or off.

Ranges are specified as `lower-upper` (for example, `20-30`) or as a single number.  
When using `HeaderProtectionKey`, the `S1-S4` parameters must be at least 12.

## Custom package feed (GitHub Pages)

This repository also publishes a full-featured [OpenWrt package feed](https://2grey.github.io/awg-openwrt/) with signed IPK repositories for OpenWrt 24.x and signed APK repositories for OpenWrt 25.x and later.

## Installation

### Via the custom package feed

1. Install the packages from the signed feed. The exact OpenWrt version and target platform are detected automatically:

   Add the `-r` option to install the Russian localization package.

   ```sh
   sh <(wget -O - https://raw.githubusercontent.com/2Grey/awg-openwrt/refs/heads/master/amneziawg-feed-install.sh)
   ```

   When migrating from `Slava-Shchipunov/awg-openwrt`, the installer removes
   the legacy feed, replaces identity-hash constraints only for AWG packages
   installed from local files.

   Before installing `luci-proto-amneziawg`, the script removes the conflicting
   `luci-app-amneziawg` package if it is installed. Existing interface
   configuration is not removed.

2. Reboot the router to load the new kernel modules.
3. Hard-refresh LuCI (`Ctrl+F5`) or open it in a private browser window.
4. Create a new interface using the `AmneziaWG VPN` protocol.

### Via the setup script

If you only need to install the packages, use the `amneziawg-install` script. It automatically downloads the packages for your device from this repository and also offers to configure an interface using the AmneziaWG protocol.

If you accept, enter the configuration parameters requested by the script. The script creates the interface, configures its firewall rules, and enables routing for the addresses in `AllowedIPs`. By default, this routes all IPv4 and IPv6 traffic through the tunnel by enabling **Route Allowed IPs** in the peer settings.

To run the script, connect to the router via SSH, enter the following command, and follow the on-screen instructions:

```sh
sh <(wget -O - https://raw.githubusercontent.com/2Grey/awg-openwrt/refs/heads/master/amneziawg-install.sh)
```

> [!IMPORTANT]
> On a clean installation, the script can load the kernel module and configure the interface without a reboot.
> If an older kernel module remains loaded after an upgrade, reboot the router and run the script again.

Additional script options:

| Option | Description |
|--------|-------------|
| `-e` | Do not install the localization package |
| `-n` | Do not configure the AmneziaWG interface |
| `-a` | Connection profile: 2.0, 3.0, 3.1, or auto (default: auto) |
| `-c` | Import connection settings from a `.conf` file |
| `-s` | Skip package installation and use the installed AmneziaWG packages |
| `-i` | OpenWrt interface name (default: `awg1`) |

The installer can configure AWG 2.0, 3.0, and 3.1 connection profiles.

The imported configuration must contain exactly one `[Peer]` section. Configure multiple peers through LuCI.

```sh
sh amneziawg-install.sh -e -a auto -c /root/client.conf
```

To enter settings interactively for a specific connection profile:

```sh
sh amneziawg-install.sh -a 2.0
sh amneziawg-install.sh -a 3.0
sh amneziawg-install.sh -a 3.1
```

> [!NOTE]
> The script checks the version reported by the installed `amneziawg-tools` and refuses to configure a newer profile when the installed version does not support it.
> If an older kernel module is still loaded after an upgrade, reboot the router and run the script again.

### Checking router information

The script prints the OpenWrt and LuCI versions, the `target` and `subtarget`,
both LuCI package variants, legacy feeds, AWG constraints from `/etc/apk/world`,
the actual LuCI parser status, and the loaded AmneziaWG kernel module version:

```sh
sh <(wget -O - https://raw.githubusercontent.com/2Grey/awg-openwrt/refs/heads/master/amneziawg-check.sh)
```

### Manual package installation

Download the three required packages for your platform from the [Releases](https://github.com/2Grey/awg-openwrt/releases) page: `amneziawg-tools_*`, `kmod-amneziawg_*`, and `luci-proto-amneziawg_*`. For Russian localization, also download the optional `luci-i18n-amneziawg-ru_*` package. OpenWrt 24.10 uses `.ipk` packages, while OpenWrt 25.12 uses `.apk` packages.

#### Selecting packages for your device

Follow the [Specify build variables](https://github.com/itdoginfo/domain-routing-openwrt/wiki/Amnezia-WG-Build#%D1%83%D0%BA%D0%B0%D0%B7%D1%8B%D0%B2%D0%B0%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5-%D0%B4%D0%BB%D1%8F-%D1%81%D0%B1%D0%BE%D1%80%D0%BA%D0%B8) instructions to determine your device's `target` and `subtarget`.

Open the release page for your OpenWrt version and use your browser's page search (Ctrl+F) to find the three required packages for your device. Their names end in `target_subtarget.ipk` for OpenWrt 24.10 or `target_subtarget.apk` for OpenWrt 25.12.

#### Supported OpenWrt versions

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

## Building packages

This repository includes a script that retrieves the list of supported platforms from the OpenWrt website and automatically starts building AmneziaWG packages for all devices.

Builds for older OpenWrt versions are available in the [Slava-Shchipunov/awg-openwrt](https://github.com/Slava-Shchipunov/awg-openwrt) repository.

### Building for all supported devices

1. Create a fork of this repository.
2. Open the **Actions** tab and enable GitHub Actions. They are disabled by default in forks.
3. Open the **Code** tab, select **Releases** on the right side of the page, and click **Draft a new release**.
4. Click **Choose a tag** and create a tag in the `vX.X.X` format, where `X.X.X` is the required OpenWrt version, for example `v24.10.8`.
5. Select the `master` branch as the target.
6. Enter a release title.
7. Click **Publish release**. Creating the tag starts the package build.

GitHub provides free standard runners for public repositories. The existing workflows have run up to 20 jobs in parallel. Each job usually takes 10–15 minutes, while a complete build takes about 60 minutes.

### Building for a specific platform

Instructions for building AWG 1.0 packages for a specific platform are available in the [Wiki](https://github.com/itdoginfo/domain-routing-openwrt/wiki/Amnezia-WG-Build). Such a build takes about two hours.

The current AWG 3.1 stack, which is compatible with AWG 2.0 and 3.0 connection profiles, can be built for specific platforms as follows:

1. Create a fork of this repository.
2. Open the **Actions** tab and enable GitHub Actions. They are disabled by default in forks.
3. Select **Create Release on Tag** from the workflow list on the left.
4. Click **Run workflow**.
5. Enter the OpenWrt version, for example `24.10.8`; a comma-separated list of `target` values, for example `stm32,ramips`; and a comma-separated list of `subtarget` values, for example `stm32mp1,mt7621`. Only existing `target/subtarget` pairs are built.
6. Click **Run workflow**. A build for one device usually takes 10–15 minutes; after it completes, a release is created for the specified OpenWrt version.

### Building for OpenWrt Snapshot

The **Build OpenWrt Snapshot** workflow checks the current OpenWrt Snapshot revision and kernel ABI, builds APK packages, and publishes them as a prerelease. If all four packages for that revision, platform, and ABI have already been published, the duplicate build is skipped.

To start it manually, open **Actions → Build OpenWrt Snapshot → Run workflow**. Leave `target` and `subtarget` empty to build every available platform. To run a selective build, provide both comma-separated lists.

The workflow also runs every third day of the month at `21:17 UTC` using the `17 21 */3 * *` schedule and checks every supported `target/subtarget` pair. `microchipsw/lan969x` is temporarily skipped because its Snapshot SDK cannot package `kmod-crypto-xxhash` while `xxhash.ko` is built into the kernel.

GitHub runs scheduled workflows only from the repository's default branch. GitHub Actions must also be enabled in forks.
