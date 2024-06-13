#### Inside command mode `/`

```
`<leader>sh` - Search global help
`<leader>sk` - Search keymaps
`?` - Show help for current buffer

`<leader>gg` - Open neogit
`<leader>b` - Open neotree

`<C-o>` - Exit insert mode for exactly one move
`<C-hjkl>` - Use ctrl + hjkl keys to move focus to the buffer

`hciw` - Delete inside quote and toggle to insert mode

`yinq` - Yank inside next quote

`va(` - Visually select around `(` symbol
`dt(` - Delete everything till `(` symbol

`%` - Jump to prev/next `()` `{}`

`gd` - Goto definition
`gD` - Goto declaration
`gr` - Goto references
`gI` - Goto implementation

`<C-q>` - after `gd` send to list everything

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

#### Inside command mode `/`

```
`%s/text/new_text - change text in buffer to new
```

> Autotag usage

```
Before        Input         After
--------------------------------------------
<div           >              <div></div>
<div></div>    ciwspan<esc>   <span></span>
--------------------------------------------
```

