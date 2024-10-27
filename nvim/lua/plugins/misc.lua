return {
	{ "wakatime/vim-wakatime" },
	{ "RRethy/vim-illuminate" },

	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({ virtual_symbol = "●" })
		end,
	},
}
