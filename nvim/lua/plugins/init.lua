return {
	{ "wakatime/vim-wakatime" },
	{ "RRethy/vim-illuminate" },
	{ "folke/ts-comments.nvim", opts = {}, event = "VeryLazy", enabled = true },

	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({ virtual_symbol = "●" })
		end,
	},
}
