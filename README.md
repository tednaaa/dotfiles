## Setup

> Brew

> Alacritty + Fish + Tmux + Starship

> asdf

## Neovim

> Inside command mode `/`

`<C-o> - Exit insert mode for exactly one move`
`<C-o> - Use to go back after goto definition`
`<C-hjkl> - Use ctrl + hjkl keys to move focus to the buffer`

`% - Jump to prev/next () {}`

`<C-a> - Increment number`
`<C-x> - Decrement number`

`cw - Delete word after and switch to insert mode`
`ci" - Delete inside quote and toggle to insert mode`

`saiw - surround with "" or () or {}`
`sd - delete surrounding "" or () or {}`

`va( - Visually select around ( symbol`
`dt( - Delete everything till ( symbol`

`gcc - Toggles the current line using linewise comment`
`gbc - Toggles the current line using blockwise comment`
`gc[count]{motion} - (Op-pending) Toggles the region using linewise comment`
`gb[count]{motion} - (Op-pending) Toggles the region using blockwise comment`

`: %s/old/new/gc - change in current buffer all matching words to new`

> In Visual select mode

`s/old/new - change inside selection only first matching for each line`
`s/old/new/g - match and replace all`
`s/old/new/gc - and also ask for each replace`

