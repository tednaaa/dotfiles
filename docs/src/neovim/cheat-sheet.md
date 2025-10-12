# Neovim Cheat Sheet

## Normal Mode

| Keymap              | Details                                                 |
| ------------------- | ------------------------------------------------------- |
| `<C-o>`             | Use to go back after goto definition                    |
| `<C-i>`             | Use to go back to definition                            |
| `<C-hjkl>`          | Use ctrl + hjkl keys to focus buffers                   |
| `<C-wv>`            | Create vertical split                                   |
| `<C-ws>`            | Create horizontal split                                 |
| `%`                 | Jump to prev/next [] or () or {}                        |
| `*`                 | Jump through cword items                                |
| `r`                 | Change symbol                                           |
| `<C-a>`             | Increment number                                        |
| `<C-x>`             | Decrement number                                        |
| `diw`               | Delete word from any position                           |
| `viwp`              | Replace word after previous move                        |
| `ciw`               | Delete word and switch to insert mode                   |
| `ci..`              | Delete inside "" or () or {} and switch to insert mode  |
| `saiw..`            | Surround with "" or () or {}                            |
| `sd..`              | Delete surrounding "" or () or {}                       |
| `vas`               | Visual select blocks                                    |
| `va(`               | Visually select around ( symbol                         |
| `dt(`               | Delete everything till ( symbol                         |
| `gcc`               | Toggles the current line using linewise comment         |
| `gbc`               | Toggles the current line using blockwise comment        |
| `gc[count]{motion}` | (Op-pending) Toggles the region using linewise comment  |
| `gb[count]{motion}` | (Op-pending) Toggles the region using blockwise comment |

## Insert Mode

| Keymap  | Details                               |
| ------- | ------------------------------------- |
| `<C-o>` | Exit insert mode for exactly one move |

## Command Mode

| Command             | Details                                                                                   |
| ------------------- | ----------------------------------------------------------------------------------------- |
| `: %s/old/new/gc`   | Change in current buffer all matching words to new                                        |
| `: s/old/new`       | Change inside selection only first matching for each line (In Visual select mode `'<,'>`) |
| `: s/old/new/g`     | Match and replace all (In Visual select mode `'<,'>`)                                     |
| `: s/old/new/gc`    | Match, replace all, and ask for each replace (In Visual select mode `'<,'>`)              |
| `:s/\<old\>/new/gi` | Replace exactly old word (older will be ignored)                                          |
