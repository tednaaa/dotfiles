return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").setup({})

			local fzf = require("fzf-lua")

			vim.keymap.set("n", "<leader>ht", fzf.help_tags, { desc = "help tags" })
			vim.keymap.set("n", "<leader>hk", fzf.keymaps, { desc = "keymaps" })

			vim.keymap.set("n", "<leader>p", fzf.files, { desc = "files" })
			vim.keymap.set("n", "<leader>pp", fzf.buffers, { desc = "buffers" })
			vim.keymap.set("n", "<leader>g/", fzf.live_grep, { desc = "live grep" })
			vim.keymap.set("n", "<leader>/", fzf.lgrep_curbuf, { desc = "live grep current buffer" })

			vim.keymap.set("n", "<leader>cw", fzf.grep_cword, { desc = "global search for word under cursor" })

			vim.keymap.set("n", "<leader>df", function()
				fzf.files({ cwd = "~/dotfiles" })
			end, { desc = "open dotfiles" })
		end,
	},
}
