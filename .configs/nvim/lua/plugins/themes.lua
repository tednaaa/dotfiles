require("catppuccin").setup({
  -- You can add theme-specific configurations here
  -- e.g., styles, integrations with other plugins
  transparent_background = false,
  integrations = {
    treesitter = true,
    cmp = true,
    gitsigns = true,
  }
})

vim.cmd.colorscheme("catppuccin")

return {
	{ "catppuccin/nvim", name = "catppuccin" }
}
