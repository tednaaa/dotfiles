return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			winopts = {
				fullscreen = true,
				preview = {
					horizontal = "right:70%",
				},
			},

			oldfiles = { cwd_only = true },
		})

		local keymap = function(mode, lhs, rhs, description)
			vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = description })
		end

		local fzf = require("fzf-lua")

		keymap("n", "<leader>ht", fzf.help_tags, "help tags")
		keymap("n", "<leader>hk", fzf.keymaps, "keymaps")

		keymap("n", "<leader>p", fzf.files, "files")
		keymap("n", "<leader>po", fzf.oldfiles, "old files")
		keymap("n", "<leader>pp", fzf.buffers, "buffers")
		keymap("n", "<leader>g/", fzf.live_grep, "live grep")
		keymap("n", "<leader>/", fzf.lgrep_curbuf, "live grep current buffer")

		keymap("n", "<leader>cw", fzf.grep_cword, "global search for word under cursor")
	end,
}
