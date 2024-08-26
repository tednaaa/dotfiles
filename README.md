## How to manage?

```bash
cd .manager
cargo run link
cargo run unlink
```

## Setup

- brew
- fish
- rust toolchain
- starship
- asdf
- wezterm
- alacritty + tmux
- neovim > zed > vscode

## Zed

Code actions: `g .`
Close all items: `ctrl w q`

Project diagnostics: `cmd shift m`

## Neovim

`<C-o>` - Exit insert mode for exactly one move
`<C-o>` - Use to go back after goto definition
`<C-i>` - Use to go back to definition
`<C-hjkl>` - Use ctrl + hjkl keys to focus buffers

`<C-wv` - Create vertical split
`<C-ws` - Create horizontal split

`%` - Jump to prev/next [] or () or {}
`*` - Jump through cword items
`r` - Change symbol

`<C-a>` - Increment number
`<C-x>` - Decrement number

`diw` - Delete word from any position
`viwp` - Replace word after previous move

`ciw` - also switch to insert mode

`ci..` - Delete inside "" or () or {} and switch to insert mode
`saiw..` - surround with "" or () or {}
`sd..` - delete surrounding "" or () or {}

`vas` - Visual select blocks
`va(` - Visually select around ( symbol
`dt(` - Delete everything till ( symbol

`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment

`: %s/old/new/gc` - change in current buffer all matching words to new

> In Visual select mode `'<,'>`

`: s/old/new` - change inside selection only first matching for each line
`: s/old/new/g` - match and replace all
`: s/old/new/gc` - and also ask for each replace
`:s/\<old\>/new/gi` - replace exactly old word (older will ignored)
