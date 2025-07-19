## Check network connection

```fish
ping google.com
```

> If you have wired connection, you should be ok

::: details If you have Wi-Fi - use `iwctl` to connect

```fish
rfkill unblock all

iwctl
station wlan0 connect "{wifi_name}"
```

:::

## Installation

```fish
archinstall
```

| Config                        |                Details                |
| ----------------------------- | :-----------------------------------: |
| disk                          | best effort, btrfs, snapper snapshots |
| swap                          |                enabled                |
| unified kernel images         |                enabled                |
| hostname, root password, user |         set whatever you want         |
| profile                       |                minimal                |
| audio                         |               pipewire                |
| kernels                       |            linux (default)            |
| network                       |          use NetworkManager           |
| timezone                      |         set whatever you want         |

```
reboot
```

::: info
now you have a minimal setup, you can login with your username and password
:::

> Wi-Fi?

::: warning use `nmcli` to connect

```fish
nmcli device wifi list
nmcli device wifi connect "{wifi_name}" password "{password}"
```
