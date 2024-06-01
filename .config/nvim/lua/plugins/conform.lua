return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	config = function()
		local conf = require("conform")
		conf.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
				go = { "gofumpt", "golines", "goimports" },
			},
			-- Set up format-on-save
			format_on_save = {
				timeout_ms = 500,
				async = false,
				lsp_fallback = true,
			},
			formatters = {
				golines = {
					prepend_args = { "-m", "120" },
				}
			},
			-- Format keymap
			vim.keymap.set({ "n", "v" }, "<leader>f", function()
				conf.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Format with Conform" })
		})

		--     local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})vim.api.nvim_create_autocmd("BufWritePre", {
		--   pattern = "*.go",
		--   callback = function()
		--    require('go.format').goimport()
		--   end,
		--   group = format_sync_grp,
		-- })
	end,
}
