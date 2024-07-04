return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = function()
			return {
				style = "moon",
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			}
		end,
		init = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	config = function()
	-- 		require("onedark").setup({ style = "darker" })
	-- 		require("onedark").load()
	-- 	end,
	-- },
}
