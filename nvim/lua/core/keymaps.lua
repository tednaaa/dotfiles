local keymap = function(mode, lhs, rhs, description)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = description })
end

keymap("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap("i", "jj", "<Esc>")

-- Disable arrow keys :)
keymap({ "n", "i" }, "<left>", "")
keymap({ "n", "i" }, "<right>", "")
keymap({ "n", "i" }, "<up>", "")
keymap({ "n", "i" }, "<down>", "")

keymap("n", "<leader>w", "<cmd>update<cr>", "save buffer")

keymap("n", "J", "mzJ`z", "Join line with next")

keymap("v", "J", ":m '>+1<CR>gv=gv", "Move selected line down")
keymap("v", "K", ":m '<-2<CR>gv=gv", "Move selected line up")

keymap("n", "x", '"_x', "Delete without copy to clipboard")
keymap("n", "ds", '"_d', "Delete without copy to clipboard")
keymap("x", "p", '"_dP', "Paste without copy to clipboard")

keymap("n", "<C-d>", "<C-d>zz", "Autocenter on scroll down")
keymap("n", "<C-u>", "<C-u>zz", "Autocenter on scroll up")

keymap("n", "<n>", "nzzzv", "Autocenter on search forward")
keymap("n", "<N>", "Nzzzv", "Autocenter on search backward")
