local M = {}

---describes argument, useful in mapping when you have *prototype*-like mapping
---options.
---@param x table
---@param desc string
---@return table
function M.described(x, desc)
	return vim.tbl_extend("force", x, { desc = desc })
end

function M.on_attach(bufnr)
	-- Enable completion triggered by <c-x><c-o>
	-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- See `:help vim.lsp.*` for documentation on any of the below functions
end

function M.get_capabilities()
	return require("cmp_nvim_lsp").default_capabilities()
end

return M
