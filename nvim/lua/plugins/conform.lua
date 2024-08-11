return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			typescript = { "prettierd", "eslint_d" },
			typescriptreact = { "prettierd", "eslint_d" },
			javascript = { "prettierd", "eslint_d" },
			javascriptreact = { "prettierd", "eslint_d" },
			json = { "prettierd" },
		},
		format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
	},
}
