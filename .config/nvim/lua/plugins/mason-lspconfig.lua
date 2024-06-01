return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"tsserver",
					"html",
					"cssls",
					"lua_ls",
					"emmet_ls",
					"pyright",
					"volar",
					"gopls",
					"golangci_lint_ls",

				},
				automatic_installation = true,
			})
		end,
	},
}
