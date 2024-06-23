return {
	{ "wakatime/vim-wakatime" },
	{ "numToStr/Comment.nvim", opts = {}, lazy = false },
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({ style = "darker" })
			require("onedark").load()
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
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
