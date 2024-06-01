local lsp = require "core.functions.lsp"

local described = lsp.described

local function setup_generic()
	local lspconfig = require "lspconfig"

	local generic_servers = {
		"pyright",
		"rust_analyzer",
		"html",
		"cssls",
		"emmet_ls",
		"bashls",
		"volar",
		"gopls",
		"lua_ls",
	}
	for _, client in ipairs(generic_servers) do
		lspconfig[client].setup {
			on_attach = lsp.on_attach,
			capabilities = lsp.get_capabilities(),
		}
	end
end

local function setup_gopls()
	local lspconfig = require "lspconfig"

	lspconfig.gopls.setup {
		on_attach = function(client)
			client.server_capabilities.documentFormattingProvider = false
			lsp.on_attach(client)
		end,
		capabilities = lsp.get_capabilities(),
		settings = {
			gopls = {
				gofumpt = true,
				analyses = { unusedparams = true },
				staticcheck = true,
			},
		},
	}
	lspconfig["golangci_lint_ls"].setup {
		on_attach = function(client)
			client.server_capabilities.documentFormattingProvider = false
			lsp.on_attach(client)
		end,
		capabilities = lsp.get_capabilities(),
	}
end

local function setup_tsserver()
	local lspconfig = require "lspconfig"

	lspconfig.tsserver.setup {
		on_attach = function(client)
			client.server_capabilities.documentFormattingProvider = false
			lsp.on_attach(client)
		end,
		capabilities = lsp.get_capabilities(),
	}
end

local function setup_lua()
	local lspconfig = require "lspconfig"

	lspconfig.lua_ls.setup {
		on_attach = lsp.on_attach,
		capabilities = lsp.get_capabilities(),
		settings = {
			Lua = {
				diagnostics = {
					globals = {
						"vim",
						"assert",
						"describe",
						"it",
						"before_each",
						"after_each",
						"pending",
						"clear",
						"G_P",
						"G_R",
					},
				},
				format = {
					enable = false,
				},
			},
		},
	}
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"IlyasYOY/coredor.nvim",
			"folke/neodev.nvim",
			"nvim-telescope/telescope.nvim",
			tag = "0.1.4",
			"hrsh7th/cmp-nvim-lsp",

		},
		event = { "BufReadPost", "BufReadPre", "BufNewFile" },
		config = function()
			require("neodev").setup {
				override = function(root_dir, options)
					for _, plugin in ipairs(require("lazy").plugins()) do
						if plugin.dev and root_dir == plugin.dir then
							options.plugins = true
						end
					end
				end,
			}
			setup_generic()
			setup_tsserver()
			setup_lua()
			setup_gopls()

			local bufopts = { noremap = true, silent = true }

			local builtins = require("telescope.builtin")
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics" })
			vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, { desc = "Next diagnostics" })
			vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev, { desc = "Previous diagnostics" })
			vim.keymap.set("n", "gd", builtins.lsp_definitions, { desc = "Go to definition" })
			vim.keymap.set("n", "gD", builtins.lsp_type_definitions, { desc = "Go to type definition" })
			vim.keymap.set("n", "go", builtins.lsp_outgoing_calls, { desc = "Show outgoing calls" })
			vim.keymap.set("n", "gi", builtins.lsp_incoming_calls, { desc = "Show incoming calls " })
			vim.keymap.set("n", "gI", builtins.lsp_implementations, { desc = "Show implementations" })
			vim.keymap.set("n", "gs", builtins.lsp_document_symbols, { desc = "Show Symbols" })
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Lsp rename" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, described(bufopts, "Perform code action"))
			vim.keymap.set("n", "K", vim.lsp.buf.hover, described(bufopts, "Show Documentation"))

			local signs = { Error = " ", Warn = " ", Hint = "💡", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
				underline = true,
				update_in_insert = false,
				virtual_text = { spacing = 4, prefix = "●" },
				severity_sort = true,
			})
		end,
	},
}
