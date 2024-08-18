vim.filetype.add({ extension = { ["http"] = "http" } })

return {
	"mistweaverco/kulala.nvim",
	config = function()
		local kulala = require("kulala")
		kulala.setup()

		vim.keymap.set("n", "<A-k>", kulala.jump_prev, { noremap = true, silent = true })
		vim.keymap.set("n", "<A-j>", kulala.jump_next, { noremap = true, silent = true })
		vim.keymap.set("n", "<A-l>", kulala.run, { noremap = true, silent = true })
	end,
}
