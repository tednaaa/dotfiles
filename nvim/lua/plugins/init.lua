return {
	{ "wakatime/vim-wakatime" },
	{ "RRethy/vim-illuminate" },
	{ "folke/ts-comments.nvim", opts = {}, event = "VeryLazy", enabled = true },
	{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },

	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({
				virtual_symbol = "●",
				render = "virtual",
			})
		end,
	},
}
