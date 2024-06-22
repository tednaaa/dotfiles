vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "jj", "<Esc>")

-- Disable arrow keys :)
vim.keymap.set({ "n", "i" }, "<left>", "")
vim.keymap.set({ "n", "i" }, "<right>", "")
vim.keymap.set({ "n", "i" }, "<up>", "")
vim.keymap.set({ "n", "i" }, "<down>", "")

vim.keymap.set("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line with next" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

vim.keymap.set("n", "ds", '"_d', { desc = "Delete without copy to clipboard" })
vim.keymap.set("x", "p", '"_dP', { desc = "Paste without copy to clipboard" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Autocenter on scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Autocenter on scroll up" })

vim.keymap.set("n", "<n>", "nzzzv", { desc = "Autocenter on search forward" })
vim.keymap.set("n", "<N>", "Nzzzv", { desc = "Autocenter on search backward" })
