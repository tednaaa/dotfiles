vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Git" })

return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
		config = true,
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

					keymap("n", "gh", gitsigns.preview_hunk)
					keymap("n", "ghx", gitsigns.reset_hunk)
				end,
			})
		end,
	},
}
