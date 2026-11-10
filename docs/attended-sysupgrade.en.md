# How to upgrade OpenWrt using asu.twogrey.store

This guide is for routers running official OpenWrt **24.10.x** or **25.12.x**.
The Attended Sysupgrade (ASU) server builds an image for your router. You download
the image, check which packages it includes, and then install it.

> [!IMPORTANT]
> Before changing your settings, open the [ASU website](https://asu.twogrey.store/)
> in a browser on the same network as your router. If the page does not load,
> check your connection first. In step 3, check access from the router itself.

The commands below upgrade your router within its current release series.
If you plan to move from 24.10 to 25.12, read the OpenWrt upgrade notes first.
OpenWrt 25.12 switches the package manager from `opkg` to `apk`.
[OpenWrt 25.12 release announcement and upgrade instructions](https://lists.openwrt.org/pipermail/openwrt-announce/2026-March/000081.html)

## 1. Check your OpenWrt version and back up your settings

Connect to your router over SSH as `root`. If you normally reach it through a VPN
running on the router, connect to its local network before installing the image.

```sh
ubus call system board
```

Check the `model`, `release.version`, and `release.target` fields. In LuCI,
go to **System → Backup / Flash Firmware** and download a configuration backup
to your computer.
[Backing up OpenWrt settings](https://openwrt.org/docs/guide-user/installation/sysupgrade.cli)

## 2. Install owut

Use the commands for the OpenWrt version **currently installed** on your router.
If `owut --version` already reports a version, skip the installation commands.

### OpenWrt 24.10.x

```sh
opkg update && opkg install owut
owut --version
```

To update an existing installation, run `opkg update && opkg upgrade owut`.
If you see `Unknown package 'owut'`, check the output of `opkg update` and make
sure the official repositories for your installed OpenWrt version are reachable.
[Installing owut on OpenWrt 24.10](https://openwrt.org/docs/guide-user/installation/sysupgrade.owut#installation_and_upgrading_owut)

### OpenWrt 25.12.x

```sh
apk -U add owut
owut --version
```

If you want to keep AmneziaWG or other packages from third-party repositories,
check that `owut` supports passing those repositories to the server. The
following command should print a line containing `--repositories-mode`.

```sh
owut --help | grep -F -- '--repositories-mode'
```

If the option is missing, run `apk -U upgrade owut` and check again. If it is
still missing, wait until you have a client with this feature before upgrading
with third-party packages.
[Third-party APK repository support in owut](https://github.com/efahl/owut/pull/82)

## 3. Set the upgrade server

```sh
uci set 'attendedsysupgrade.@server[0].url=https://asu.twogrey.store'
uci commit attendedsysupgrade
uclient-fetch -O /dev/null https://asu.twogrey.store/json/v1/overview.json
```

If the last command downloads the file successfully, continue to the next step.
For connection or certificate errors, see [Troubleshooting](#troubleshooting).

To use the OpenWrt server again, see [Switch back to the official ASU server](#switch-back-to-the-official-asu-server).

## 4. Check for an upgrade and download the image

Run `owut check` for your release series. Confirm that `ASU-Server` shows
`https://asu.twogrey.store` and that `Profile` and `Version-to` match your router
model and the release you want to install.

### If you run OpenWrt 24.10.x

This example uses `24.10.8`. Choose a release available for your router model.

```sh
owut check -V 24.10.8 --verbose
```

The standard `owut` client for 24.10 does not send third-party IPK repositories
to the server. If you have AmneziaWG installed, the server needs access to those
packages through a separate configuration. If the check reports that AmneziaWG
packages are missing, wait until the server can include them in the image.
[owut source for the OpenWrt 24.10 package](https://github.com/efahl/owut/blob/db17536ec5cbcc6a76a51e65f3d192b6a2184abb/files/owut)

If the check passes, download the image.

```sh
owut download -V 24.10.8 --verbose
```

### If you run OpenWrt 25.12.x

If you have AmneziaWG installed, make sure you have configured its signed feed
and that `apk update` completes without signature errors. Add the public key
to the list of files OpenWrt saves during an upgrade. The last check should
print the path to the key. Download a fresh configuration backup after adding
it. [Setting up the signed AmneziaWG feed](../README.en.md#via-the-custom-package-feed)

```sh
key=/etc/apk/keys/awg-openwrt-feed.pem
if [ -s "$key" ]; then
  grep -qxF "$key" /etc/sysupgrade.conf ||
    printf '\n%s\n' "$key" >> /etc/sysupgrade.conf
  sysupgrade -l | grep -Fx "$key"
else
  echo "Missing key $key"
fi
```

This example uses `25.12.6` for the GL.iNet GL-MT6000 (`mediatek/filogic`).
Choose a release with AmneziaWG packages for your target platform. The `append`
mode adds third-party repositories alongside the official ones. If you only use
official packages, you can omit `--repositories-mode append` from both commands.
[Available AmneziaWG releases](https://2grey.github.io/awg-openwrt/)

```sh
owut check -V 25.12.6 --repositories-mode append --verbose
```

If the check passes, download the image.

```sh
owut download -V 25.12.6 --repositories-mode append --verbose
```

### If the check reports missing packages

`missing to-version` means the package is unavailable for the target release.
If you can do without it, add `--remove` with a comma-separated list of package
names to both `check` and `download`. Those packages will be absent after the
upgrade.

Use the following commands if the check for 25.12.6 reports Cheburprobe and the
Aurora theme as missing and you are ready to upgrade without them.

```sh
exclude='cheburprobe,luci-app-cheburprobe,luci-theme-aurora'
owut check -V 25.12.6 --repositories-mode append --remove "$exclude" --verbose &&
  owut download -V 25.12.6 --repositories-mode append --remove "$exclude" --verbose
```

Only exclude packages listed in your output that you can safely remove. If a
package you rely on is unavailable, wait before installing the upgrade.
[Adding and removing packages from an image](https://openwrt.org/docs/guide-user/installation/sysupgrade.owut#adding_and_removing_packages)

## 5. Check and install the image

After `owut download` succeeds, check the release number in the manifest. If you
want to keep AmneziaWG, the output should show a version for all three packages.

```sh
manifest=/tmp/firmware-manifest.json
jsonfilter -i "$manifest" -e '@.version_number'

for pkg in kmod-amneziawg amneziawg-tools luci-proto-amneziawg; do
  pkg_version=$(jsonfilter -i "$manifest" -e "@.manifest[\"$pkg\"]")
  printf '%s %s\n' "$pkg" "${pkg_version:-MISSING}"
done
```

### Stop Podkop before installing the upgrade

If Podkop is installed on your router, stop it before running `owut install`.
The command below checks whether the service is installed. If the stop command
fails, wait before installing the upgrade. [OpenWrt upgrades in the Podkop documentation](https://podkop.net/docs/install/#obnovlenie-openwrt)

```sh
if [ -x /etc/init.d/podkop ]; then
  service podkop stop
fi
```

### Install the upgrade

Once you have confirmed the release and the packages you need, install the
image. `owut install` verifies the downloaded image, installs it while keeping
your settings, and reboots the router. Wait for it to come back online.
[How owut install works](https://openwrt.org/docs/guide-user/installation/sysupgrade.owut)

```sh
owut install
```

## 6. Check the router after it reboots

Reconnect to the router and run `ubus call system board` to verify the installed
release. If you use AmneziaWG, check in LuCI that all three packages are
installed and that your tunnel comes up.

If you used Podkop before the upgrade and it did not start automatically, run
`service podkop start`.

The AmneziaWG feed URL must match the installed OpenWrt release. If it still
points to the previous release, run the signed feed installer again. It selects
the URL for your current release and target platform.
[AmneziaWG feed installer](../README.en.md#via-the-custom-package-feed)

## Switch back to the official ASU server

OpenWrt uses `https://sysupgrade.openwrt.org` by default. This server builds
OpenWrt upgrade images on request for Attended Sysupgrade clients.
[Official OpenWrt Sysupgrade Server](https://sysupgrade.openwrt.org)

To switch back, set the URL on the router over SSH. The last command should
print `https://sysupgrade.openwrt.org`.

```sh
uci set 'attendedsysupgrade.@server[0].url=https://sysupgrade.openwrt.org' &&
  uci commit attendedsysupgrade &&
  uci get 'attendedsysupgrade.@server[0].url'
```

After switching, run `owut check --verbose` and check the `ASU-Server` line.
The official server may reject a third-party repository with a
`Repository not allowed` error. If you rely on AmneziaWG from a third-party
repository, confirm that the image includes all three AmneziaWG packages
before installing it.
[Third-party repositories on the official ASU server](https://github.com/openwrt/asu/issues/1668)

## Troubleshooting

- **The server is unreachable or certificate verification fails.** Check the
  router's date and time with `date -u`, then retry `uclient-fetch` from step 3.
  If the time is correct, send the full error to the server administrator.
- **`UNTRUSTED signature` on OpenWrt 25.12.** Restore the public signing key
  at `/etc/apk/keys/awg-openwrt-feed.pem`, run `apk update`, and add the key
  to the list of files saved during upgrades as shown in step 4.
  [AmneziaWG public signing key](https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem)
- **`Repository not allowed`, a build error, or `JobTimeoutException`.** Send
  the server administrator your router model, the target release, the
  `Request hash` line if present, and the error message.

### DNS stops working after an upgrade with Podkop running

If you upgraded OpenWrt with Podkop running and domain names stopped resolving
after the reboot, run these commands on the router over SSH. They replace the
first `dnsmasq` instance's configured upstream DNS server list with `8.8.8.8`.
[DNS recovery in the Podkop documentation](https://podkop.net/docs/install/#obnovlenie-openwrt)

```sh
service podkop stop

uci -q delete dhcp.@dnsmasq[0].server
uci add_list dhcp.@dnsmasq[0].server="8.8.8.8"
uci commit dhcp
service dnsmasq restart
ntpd -q -p ptbtime1.ptb.de

service podkop start
```
