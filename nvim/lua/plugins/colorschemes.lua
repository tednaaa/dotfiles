return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{ "xiyaowong/transparent.nvim" },
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	config = function()
	-- 		require("onedark").setup({ style = "darker" })
	-- 		require("onedark").load()
	-- 	end,
	-- },
}
