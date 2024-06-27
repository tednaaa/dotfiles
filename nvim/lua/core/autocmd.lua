vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

vim.api.nvim_create_autocmd({ "CmdlineLeave", "VimEnter" }, {
	callback = function()
		vim.opt.pumheight = 15
	end,
})
vim.api.nvim_create_autocmd("CmdlineEnter", {
	callback = function()
		vim.opt.pumheight = 7
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking copying text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
