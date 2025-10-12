#### There are 2 commands

```fish
symm packages diff
symm packages install
```

- under the hood it will use `paru` so you can specify both, extra and aur packages

- also refer to my [dotfiles](https://github.com/tednaaa/dotfiles)

```toml [~/dotfiles/dotfiles.toml]
[packages]
ignored = ["some_ignored_package"]

nvidia = ["nvidia", "nvidia-utils"]

apps = ["firefox", "google-chrome"]
```
