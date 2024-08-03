return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			winopts = {
				fullscreen = true,
				preview = {
					layout = "vertial",
					vertical = "down:60%",

					-- layout = "horizontal",
					-- horizontal = "right:60%",
				},
			},

			oldfiles = { cwd_only = true },
		})

		local keymap = function(mode, lhs, rhs)
			vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
		end

		local fzf = require("fzf-lua")

		keymap("n", "<leader>ht", fzf.help_tags)
		keymap("n", "<leader>hk", fzf.keymaps)

		keymap("n", "<leader>p", fzf.files)
		keymap("n", "<leader>po", fzf.oldfiles)
		keymap("n", "<leader>g/", fzf.grep_project)
		keymap("n", "<leader>/", fzf.grep_curbuf)

		keymap("n", "<leader>cw", fzf.grep_cword)
		keymap("n", "<leader>ccw", function()
			fzf.lgrep_curbuf({ search = vim.fn.expand("<cword>") })
		end)
	end,
}
