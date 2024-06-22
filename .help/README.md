## Setup

> Brew

> Alacritty + Fish + Tmux + Starship

> asdf

### Neovim Helper

> Inside command mode `/`

```
`<leader>sh` - Search global help
`<leader>sk` - Search keymaps
`?` - Show help for current buffer

`<leader>gg` - Open fugitive

`<C-o>` - Exit insert mode for exactly one move
`<C-hjkl>` - Use ctrl + hjkl keys to move focus to the buffer

`<C-a>` - Increment number
`<C-x>` - Decrement number

`ciw` - Delete inside quote and toggle to insert mode

`va(` - Visually select around `(` symbol
`dt(` - Delete everything till `(` symbol

`%` - Jump to prev/next `()` `{}`

`gd` - Goto definition
`gD` - Goto declaration
`gr` - Goto references
`gI` - Goto implementation

`[d` - Go to previous diagnostic message
`]d` - Go to next diagnostic message

`<leader>rn` - Rename the variable under your cursor
`<leader>ca` - Execute a code action under your cursor

`<leader>ds` - Show document symbols
`<leader>ws` - Show workspace symbols

`K` - Hover documentation

`<leader>/` - Search in current buffer
`<leader>g/` - Search in project

`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
```

> Inside command mode `/`

```
`%s/old_text/new_text - change in current buffer all matching words to new
```

> Autotag usage

```
Before        Input         After
--------------------------------------------
<div           >              <div></div>
<div></div>    ciwspan<esc>   <span></span>
--------------------------------------------
```
