local keymap = function(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false

	vim.keymap.set(mode, lhs, rhs, opts)
end

keymap("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap("n", "<esc>", "<cmd>nohlsearch<cr>")
keymap("i", "jj", "<esc>")

-- better up/down
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
keymap({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

keymap("n", "<leader>w", "<cmd>update<cr>", { desc = "save buffer" })

keymap("n", "J", "mzJ`z", { desc = "Join line with next" })

keymap("n", "x", '"_x', { desc = "Delete without copy to clipboard" })
keymap("x", "p", '"_dP', { desc = "Paste without copy to clipboard" })

-- Autocenter
keymap("n", "<C-d>", "<C-d>zz", { desc = "Autocenter on scroll down" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Autocenter on scroll up" })
keymap("n", "<n>", "nzzzv", { desc = "Autocenter on search forward" })
keymap("n", "<N>", "Nzzzv", { desc = "Autocenter on search backward" })

-- Disable arrow keys :)
keymap({ "n", "i" }, "<left>", "")
keymap({ "n", "i" }, "<right>", "")
keymap({ "n", "i" }, "<up>", "")
keymap({ "n", "i" }, "<down>", "")
