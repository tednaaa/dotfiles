### How to manage dotfiles?

> Also check symlinks in `dotfiles.toml`

```bash
cargo install symm
symm link
symm unlink
```

### Arch Installation with KDE (intel + nvidia)

> Check internet connection

```
ping google.com
```

> [!NOTE]
> if you are using wifi, check [this](#connect-to-wifi)

> Disk partitioning

```
# check existing partitions
lsblk

# create partitions (nvme0n1 is the name of the disk)
cfdisk /dev/nvme0n1
```

| Number | Type             | Size                             |
| ------ | ---------------- | -------------------------------- |
| 1      | EFI              | 1 GB                             |
| 2      | Linux Swap       | 16 GB                            |
| 3      | Linux Filesystem | 950 GB (remaining space on disk) |

> Formatting

```
mkfs.fat -F 32 /dev/nvme0n1p1
mkswap /dev/nvme0n1p2
mkfs.btrfs /dev/nvme0n1p3
```

> Mounting

```
mount /dev/nvme0n1p3 /mnt

btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home

umount /mnt

mount -o compress=zstd,subvol=@ /dev/nvme0n1p3 /mnt
mkdir -p /mnt/home
mount -o compress=zstd,subvol=@home /dev/nvme0n1p3 /mnt/home

mkdir -p /mnt/efi
mount /dev/nvme0n1p1 /mnt/efi

swapon /dev/nvme0n1p2
```

> Package Installation

```
pacstrap -K /mnt base base-devel linux linux-firmware git btrfs-progs grub efibootmgr grub-btrfs inotify-tools timeshift neovim networkmanager
pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber fish openssh man sudo
```

> Fstab

```
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```

> Context swith to our new system

```
arch-chroot /mnt
```

> Timezone Setup

```
ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
hwclock --systohc
```

> Locale Setup, uncomment line with `en_US.UTF-8`

```
nvim /etc/locale.gen
locale-gen
```

> Add hostname

```
echo Archi > /etc/hostname
```

> Configure `/etc/hosts`

```
127.0.0.1 localhost
::1 localhost
127.0.1.1 Archi
```

> Root and Users

```
passwd

useradd -mG wheel {username}
passwd {username}

# uncomment line which says like `Uncomment to let members of group wheel execute any action`
EDITOR=nvim visudo
```

> Grub Setup

```
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

> Unmount everything and reboot

```
systemctl enable NetworkManager

exit

umount -R /mnt

reboot

timedatectl set-ntp true
```

> Automatic snapshot setup

```
sudo EDITOR=nvim systemctl edit --full grub-btrfsd

# change ExecStart line to this
ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto

sudo systemctl enable grub-btrfsd
```

> yay setup `required to install timeshift-autosnap package`

```
sudo pacman -S go

# from yay docs
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si

yay -S timeshift-autosnap

reboot
```

> Driver installation, also you can check [arch wiki](https://wiki.archlinux.org/title/Xorg#Driver_installation)

```
sudo pacman -S intel-ucode nvidia nvidia-utils lib32-nvidia-utils
```

> [!NOTE]
> To install `lib32-nvidia-utils` you need to enable `multilib`

```
sudo nvim /etc/pacman.conf
```

> Desktop Environment `Minimal KDE`

```
sudo pacman -S plasma-desktop plasma-pa plasma-nm plasma-firewall kscreen bluedevil powerdevil power-profiles-daemon dolphin ark spectacle korganizer
```

> My additional packages

```
yay -S google-chrome firefox wezterm fzf ripgrep fd bat git-delta lazygit lazydocker appimagelauncher btop openbsd-netcat rsync
```

> Now install display manager and reboot

```
sudo pacman -S sddm

sudo systemctl enable sddm

reboot
```

> [!TIP]
> And that's it, enjoy your new system!

> Some more additional packages

- `asdf` - Manage all your runtime versions with one tool!
- `starship` - The minimal, blazing-fast, and infinitely customizable prompt for any shell!

## Connect to Wifi

```
rfkill unblock all
iwctl

station wlan0 connect {wifi_name}
```

## Disable kwallet popup

> `.config/kwalletrc`

```
[Wallet]
Enabled=false
```
