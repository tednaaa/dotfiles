return {
	{ "wakatime/vim-wakatime" },
	{ "numToStr/Comment.nvim", opts = {}, lazy = false },
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("kanagawa")
		end,
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })

			require("mini.surround").setup()

			local statusline = require("mini.statusline")

			statusline.setup({ use_icons = vim.g.have_nerd_font })
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
}
