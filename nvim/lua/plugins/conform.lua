return {
	"stevearc/conform.nvim",
	event = { "BufEnter" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "eslint_d", "prettierd" },
			typescript = { "eslint_d", "prettierd" },
			javascriptreact = { "eslint_d", "prettierd" },
			typescriptreact = { "eslint_d", "prettierd" },
			json = { "prettierd" },
		},
		format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
	},
}
