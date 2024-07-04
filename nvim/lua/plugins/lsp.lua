return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Also you can install manually using :MasonInstall {name}
		-- For example eslint_d and prettier_d
		mason.setup()
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"taplo",
				"gopls",
				"golangci_lint_ls",
				"tsserver",
				"eslint",
				"html",
				"cssls",
				"emmet_ls",
				"tailwindcss",
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(event)
				local opts = { buffer = event.buf, silent = true }

				local fzf = require("fzf-lua")

				vim.keymap.set("n", "gD", fzf.lsp_declarations, opts)
				vim.keymap.set("n", "gr", fzf.lsp_references, opts)
				vim.keymap.set("n", "gd", fzf.lsp_definitions, opts)
				vim.keymap.set("n", "gi", fzf.lsp_implementations, opts)
				vim.keymap.set("n", "gt", fzf.lsp_typedefs, opts)

				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "<leader>pd", fzf.diagnostics_workspace, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", fzf.lsp_code_actions, opts)

				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				vim.keymap.set("n", "<leader>hh", function()
					local reversed_value = not vim.lsp.inlay_hint.is_enabled({})

					vim.lsp.inlay_hint.enable(reversed_value)
				end, opts)

				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						completion = { callSnippet = "Replace" },
					},
				},
			},
			rust_analyzer = {
				settings = {
					check = { command = "clippy" },
				},
			},
			docker_compose_language_service = {
				filetypes = { "yml.docker-compose" },
			},
		}

		mason_lspconfig.setup_handlers({
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				require("lspconfig")[server_name].setup(server)
			end,
		})
	end,
}
