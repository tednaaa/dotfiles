# Arch Linux Ansible Configuration

This Ansible configuration automates the setup of Arch Linux with KDE desktop environment, development tools, and dotfiles management using the `symm` tool.

## Prerequisites

- Fresh Arch Linux installation (minimal setup)
- Internet connection
- User account with sudo privileges
- Ansible installed

### Install Ansible

```bash
sudo pacman -S ansible
```

## Quick Start

### 1. Full System Setup

Run the complete setup including KDE, development tools, Rust, and symm:

```bash
cd ansible
ansible-playbook site.yml
```

### 2. Rust and Symm Only

If you only want to install Rust (via rustup) and symm:

```bash
cd ansible
ansible-playbook rust-setup.yml
```

### 3. Dotfiles Setup Only

If you already have Rust and symm installed and just want to manage dotfiles:

```bash
cd ansible
ansible-playbook dotfiles.yml
```

## Configuration

### Variables

Edit `group_vars/all.yml` to customize the installation:

```yaml
# Feature flags
install_kde: true          # Install KDE Plasma
install_hyprland: false    # Install Hyprland (alternative to KDE)
install_nvidia: false      # Install NVIDIA drivers
install_yay: true          # Install YAY AUR helper
enable_multilib: true      # Enable multilib repository

# Dotfiles
dotfiles_repo: "https://github.com/yourusername/dotfiles.git"
```

### Inventory

The default inventory (`inventory.ini`) is configured for local execution. Modify if needed:

```ini
[local]
localhost ansible_connection=local
```

## What Gets Installed

### Base System
- Fish shell (set as default)
- Neovim text editor
- Base development tools (base-devel, git, curl, wget)

### KDE Desktop Environment
- Plasma Desktop
- SDDM display manager
- Essential KDE applications (Dolphin, Spectacle, Ark)
- Plasma audio, network, and power management

### Development Tools
- Wezterm terminal
- Fuzzy finder (fzf)
- Text processing (ripgrep, fd, bat)
- Git utilities (git-delta, lazygit, lazydocker)
- System monitoring (btop)
- File utilities (rsync, netcat)

### Rust Ecosystem
- Rust installed via rustup (NOT pacman)
- Latest stable toolchain
- Symm dotfiles manager (installed via cargo)

### Optional Components
- Hyprland wayland compositor
- NVIDIA drivers (if enabled)
- YAY AUR helper

## Dotfiles Management

The configuration automatically sets up dotfiles management using `symm` based on your `dotfiles.toml` configuration.

### Supported Symlinks (from your dotfiles.toml)
- Wezterm configuration
- Zed editor configuration
- Neovim configuration
- Lazygit configuration
- Mise configuration
- Fish shell configuration
- Git configuration
- NPM configuration

### Manual Dotfiles Setup

If you need to set up dotfiles manually:

```bash
# Clone your dotfiles repository
git clone <your-repo> ~/dotfiles

# Link dotfiles
cd ~/dotfiles
symm link

# Unlink if needed
symm unlink
```

## Post-Installation

1. **Reboot** to start the SDDM display manager
2. **Log in** to your KDE desktop
3. **Configure** your desktop environment
4. **Verify** dotfiles are properly linked

### Kwallet Configuration

The playbook automatically disables kwallet popup by creating `~/.config/kwalletrc`:

```ini
[Wallet]
Enabled=false
```

## Troubleshooting

### Rust/Cargo Issues

If Rust tools aren't found, ensure the PATH is set:

```bash
source ~/.cargo/env
```

Or restart your terminal.

### Symm Issues

Verify symm is installed and working:

```bash
which symm
symm --version
```

### Dotfiles Not Linking

Check that:
1. `~/dotfiles` directory exists
2. `dotfiles.toml` is present and valid
3. Symm is properly installed

## Manual Commands

### YAY Installation (if skipped)

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### NVIDIA Drivers (if needed)

```bash
sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils
```

### Multilib Repository

Edit `/etc/pacman.conf` and uncomment:

```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

## Playbook Structure

- `site.yml` - Main playbook for complete system setup
- `rust-setup.yml` - Rust and symm installation only
- `dotfiles.yml` - Dotfiles management only
- `group_vars/all.yml` - Configuration variables
- `inventory.ini` - Ansible inventory
- `ansible.cfg` - Ansible configuration

## Customization

To customize the installation:

1. Fork this repository
2. Modify `group_vars/all.yml` with your preferences
3. Update package lists as needed
4. Run the playbook

## Support

This configuration is based on the Arch Linux installation documentation in the `docs/arch/` directory. Refer to those files for manual installation steps and additional details.
