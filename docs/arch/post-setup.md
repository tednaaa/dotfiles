## Default shell

> Install `fish` and set as default shell

```fish
sudo pacman -S fish

chsh -s $(which fish)
```

## Text Editor

> we need to change some config files, so I will go with `neovim`

```fish
sudo pacman -S neovim
```

## Nvidia drivers

> I'm playing some games in steam

> so I need to enable `multilib` repos and install `lib32-nvidia-utils`

> just uncomment those lines

```conf [/etc/pacman.conf]
[multilib]
Include = /etc/pacman.d/mirrorlist
```

> Install nvidia drivers

```fish
sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils
```

## AUR helper

> I'm using `yay` you can also try `paru`

```fish
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
```

## My additional packages

```fish
sudo pacman -S wezterm fzf ripgrep fd bat git-delta lazygit lazydocker appimagelauncher btop openbsd-netcat rsync
```

## Installing nerd fonts

```fish
sudo pacman -S ttf-jetbrains-mono-nerd
```
