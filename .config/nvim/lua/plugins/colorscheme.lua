return {
	"Shatur/neovim-ayu",
	priority = 1000,
	transparent = true,
	config = function()
		vim.cmd([[colorscheme ayu]])
	end,
}
