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

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking copying text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"grug-far",
		"help",
		"lspinfo",
		"qf",
		"json",
		"startuptime",
		"checkhealth",
		"gitsigns.blame",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = event.buf,
			silent = true,
			desc = "Quit buffer",
		})
	end,
})
