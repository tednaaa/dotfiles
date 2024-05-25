> symlink vscode

```
ln -s ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/dotfiles/vscode/snippets.json ~/Library/Application\ Support/Code/User/snippets/personal.code-snippets
```

## Setup

> Brew - https://brew.sh

> Fish shell - https://fishshell.com

```
# Set as default shell
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
```

> Wezterm terminal emulator - https://wezfurlong.org/wezterm

> Starship prompt - https://starship.rs

> asdf to manage multiple runtime versions - https://asdf-vm.com `(fish + git)`
