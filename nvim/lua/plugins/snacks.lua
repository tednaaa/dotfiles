return {
	"folke/snacks.nvim",
	opts = {
		dashboard = { enabled = false },

		picker = { hidden = true, ignored = true },
	},
	config = function(opts)
		Snacks.explorer.reveal(opts)
	end,
}
