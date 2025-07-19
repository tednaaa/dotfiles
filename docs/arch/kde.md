## Minimal KDE setup

```fish
sudo pacman -S plasma-desktop plasma-pa plasma-nm plasma-firewall kscreen bluedevil powerdevil power-profiles-daemon dolphin ark spectacle
```

## Display manager

```fish
sudo pacman -S sddm

sudo systemctl enable sddm

reboot
```

## Disable annoying kwallet popup

```toml [~/.config/kwalletrc]
[Wallet]
Enabled=false
```
