local keymap = vim.keymap
vim.g.mapleader = " "

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>h", ':nohlsearch<CR>', { desc = "Remove search highlight", silent = true })


-- Increment/decrement
keymap.set("n", "+", "<C-a>", { silent = true })
keymap.set("n", "-", "<C-x>", { silent = true })

--move select
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

--golang keys
keymap.set("n", "<leader>Gf", ":GoFillStruct<cr>", { desc = "Go Fill Struct", silent = true })
keymap.set("n", "<leader>Gt", ":GoAddTag", { desc = "Go Add Tags" })
keymap.set("n", "<leader>Gc", ":GoClearTag<cr>", { desc = "Go Clear Tag", silent = true })
keymap.set("n", "<leader>Gr", ":GoRename<cr>", { desc = "Go Rename" })
keymap.set("n", "<leader>GK", ":GoDoc<cr>", { desc = "Go Doc", silent = true })
keymap.set("n", "<leader>Gi", ":GoImpl<cr>", { desc = "Go Implementation", silent = true })
keymap.set("n", "<leader>Gg", ":GoGenReturn<cr>", { desc = "Generate Return Values", silent = true })
keymap.set("n", "<leader>Gd", ":GoCodeLenAct<cr>", { desc = "Generate Annotation Details", silent = true })
keymap.set("n", "<leader>Ga", ":GoCodeAction<cr>", { desc = "Go Code Action", silent = true })

--vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>v", ":vsplit<CR>", { silent = true, desc = "Vertical Split" })
keymap.set("n", "<leader>s", ":split<CR>", { silent = true, desc = "Horizontal Split" })
