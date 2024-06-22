return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				pickers = {
					find_files = {
						hidden = true,
					},
					live_grep = {
						file_ignore_patterns = { "node_modules", ".git" },
						additional_args = function(_)
							return { "--hidden" }
						end,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Search Help" })
			vim.keymap.set("n", "<leader>hk", builtin.keymaps, { desc = "Search Keymaps" })

			vim.keymap.set("n", "<leader>p", builtin.find_files, { desc = "Find files in project" })
			vim.keymap.set("n", "<leader>pr", builtin.oldfiles, { desc = "Find recent files" })
			vim.keymap.set("n", "<leader>g/", builtin.live_grep, { desc = "Find string in project" })
			vim.keymap.set("n", "<leader>pc", builtin.grep_string, { desc = "Find string under cursor in project" })
		end,
	},
}
