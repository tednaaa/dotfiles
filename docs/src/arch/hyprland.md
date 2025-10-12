> [!WARNING] Required
> be sure you have already installed [minimal archlinux](minimal-setup)

## Setup script (Hyprland)

### Install fish shell

```fish
sudo pacman -S fish
chsh -s $(which fish)
```

### Run setup script

```fish
curl -fsSL tednaaa.github.io/dotfiles/install | fish
```
