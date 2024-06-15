vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "jj", "<Esc>")

-- Disable arrow keys in normal mode :)
vim.keymap.set("n", "<left>", "")
vim.keymap.set("n", "<right>", "")
vim.keymap.set("n", "<up>", "")
vim.keymap.set("n", "<down>", "")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left buffer" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right buffer" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower buffer" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper buffer" })

vim.keymap.set("n", "<leader>gg", "<cmd>tab G<CR>", { desc = "Open fugitive" })
