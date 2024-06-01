return {
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = true,
		keys = {
			{
				"<leader>a",
				function()
					require("harpoon.mark").add_file()
				end,
				desc = "Add File to harpoon",
			},
			{
				"<C-e>",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				desc = "Open harpoon list",
			},
			{
				"<leader>1",
				function()
					require("harpoon.ui").nav_file(1)
				end,
				desc = "Go to harpoon 1",
			},
			{
				"<leader>2",
				function()
					require("harpoon.ui").nav_file(2)
				end,
				desc = "Go to harpoon 2",
			},
			{
				"<leader>3",
				function()
					require("harpoon.ui").nav_file(3)
				end,
				desc = "Go to harpoon 3",
			},
			{
				"<leader>4",
				function()
					require("harpoon.ui").nav_file(4)
				end,
				desc = "Go to harpoon 4",
			},
		},
		config = function()
			require("harpoon").setup({})
			require("telescope").load_extension("harpoon")
		end,
	},
}
