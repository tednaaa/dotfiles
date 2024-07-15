return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "j-hui/fidget.nvim", opts = {} },
		{ "ray-x/lsp_signature.nvim", event = "VeryLazy" },
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
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
				require("lsp_signature").on_attach({
					bind = true,
					handler_opts = { border = "rounded" },
				}, event.buf)

				local keymap = function(mode, lhs, rhs)
					vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, noremap = true, silent = true })
				end

				local fzf = require("fzf-lua")

				keymap("n", "gD", fzf.lsp_declarations)
				keymap("n", "gr", fzf.lsp_references)
				keymap("n", "gd", fzf.lsp_definitions)
				keymap("n", "gi", fzf.lsp_implementations)
				keymap("n", "gt", fzf.lsp_typedefs)

				keymap("n", "<leader>d", vim.diagnostic.open_float)
				keymap("n", "<leader>pd", fzf.diagnostics_workspace)
				keymap({ "n", "v" }, "<leader>ca", fzf.lsp_code_actions)

				keymap("n", "<leader>rn", vim.lsp.buf.rename)
				keymap("n", "K", vim.lsp.buf.hover)

				keymap("n", "<leader>hh", function()
					local reversed_value = not vim.lsp.inlay_hint.is_enabled({})

					vim.lsp.inlay_hint.enable(reversed_value)
				end)

				keymap("n", "<leader>rs", ":LspRestart<CR>")
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
