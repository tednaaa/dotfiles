return {
	"folke/trouble.nvim",
	config = function()
		local trouble = require("trouble")

		trouble.setup({ icons = false })

		vim.keymap.set("n", "<leader>t", function()
			trouble.toggle()
		end)
		vim.keymap.set("n", "<leader>[d", function()
			trouble.next({ skip_groups = true, jump = true })
		end)
		vim.keymap.set("n", "<leader>]d", function()
			trouble.prev({ skip_groups = true, jump = true })
		end)
	end,
}
