return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "prettierd", "eslint_d" },
				typescriptreact = { "prettierd", "eslint_d" },
				javascript = { "prettierd", "eslint_d" },
				javascriptreact = { "prettierd", "eslint_d" },
				vue = { "prettierd", "eslint_d" },
				json = { "prettierd" },
			},
			format_after_save = { async = true, lsp_format = "fallback" },
		})
	end,
}
