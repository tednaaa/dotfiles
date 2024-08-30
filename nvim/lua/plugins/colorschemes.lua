return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = function()
	-- 		return {
	-- 			style = "moon",
	-- 			transparent = true,
	-- 			styles = { sidebars = "transparent", floats = "transparent" },
	-- 		}
	-- 	end,
	-- 	init = function()
	-- 		vim.cmd("colorscheme tokyonight")
	-- 	end,
	-- },

	-- {
	-- 	"olimorris/onedarkpro.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme onedark")
	-- 	end,
	-- },

	-- {
	-- 	"loctvl842/monokai-pro.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("monokai-pro").setup()
	-- 		vim.cmd("colorscheme monokai-pro")
	-- 	end,
	-- },

	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("github-theme").setup({ options = { transparent = true } })
	--
	-- 		vim.cmd("colorscheme github_dark_dimmed")
	-- 	end,
	-- },

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		init = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},

	-- {
	-- 	"Mofiqul/vscode.nvim",
	-- 	config = function()
	-- 		require("vscode").setup()
	-- 		vim.cmd("colorscheme vscode")
	-- 	end,
	-- },
}
