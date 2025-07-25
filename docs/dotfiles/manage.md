---
outline: deep
---

#### How to manage dotfiles?

```fish
cargo install symm
# or
yay -S symm
# or
paru -S symm
```

#### There are 2 commands

```fish
symm link
symm unlink
```

- also refer to my [dotfiles](https://github.com/tednaaa/dotfiles)

```toml [~/dotfiles/dotfiles.toml]
[symlinks]
"wezterm" = ".config/wezterm"

"zed" = ".config/zed"
"nvim" = ".config/nvim"

"lazygit" = ".config/lazygit"
"mise" = ".config/mise"

"fish/config.fish" = ".config/fish/config.fish"
"git/.gitconfig" = ".gitconfig"
"npm/.npmrc" = ".npmrc"
```
