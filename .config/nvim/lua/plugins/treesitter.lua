return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{
				"windwp/nvim-ts-autotag",
				config = function()
					require("nvim-ts-autotag").setup({
						opts = {
							enable_close = true,
							enable_rename = true,
							enable_close_on_slash = true,
						},
					})
				end,
			},
			{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"rust",
					"sql",
					"astro",
					"javascript",
					"typescript",
					"html",
					"scss",
				},

				sync_install = false,
				auto_install = true,

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},

				query_linter = {
					enable = true,
					use_virtual_text = true,
					lint_events = { "BufWrite", "CursorHold" },
				},
			})
		end,
	},
}
