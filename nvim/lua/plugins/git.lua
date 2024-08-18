vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Git" })

return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
		config = function()
			local diffview = require("diffview")
			local actions = require("diffview.actions")

			diffview.setup({
				keymaps = {
					file_panel = {
						{ "n", "j", actions.select_next_entry, { desc = "Open the diff for the next file" } },
						{ "n", "k", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
					},
				},
			})

			require("neogit").setup({ integrations = { diffview = true, fzf_lua = true } })

			vim.keymap.set("n", "gvo", diffview.open)
			vim.keymap.set("n", "gvc", diffview.close)
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "" },
					topdelete = { text = "" },
					changedelete = { text = "▎" },
					untracked = { text = "▎" },
				},
				signs_staged = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "" },
					topdelete = { text = "" },
					changedelete = { text = "▎" },
				},
				on_attach = function(buffer)
					local function keymap(mode, l, r)
						vim.keymap.set(mode, l, r, { buffer = buffer })
					end

					local gitsigns = require("gitsigns")
					local fzf = require("fzf-lua")

					keymap("n", "gh", gitsigns.preview_hunk)
					keymap("n", "ghx", gitsigns.reset_hunk)

					keymap("n", "ghh", fzf.git_bcommits)
				end,
			})
		end,
	},
}
