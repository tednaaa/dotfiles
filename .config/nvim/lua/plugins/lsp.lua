return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "j-hui/fidget.nvim",                opts = {} },
		{ "onsails/lspkind.nvim" },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{
			"Exafunction/codeium.nvim",
			config = function()
				require("codeium").setup({})
			end
		},

		-- Snippets
		{ "rafamadriz/friendly-snippets" },
		{ "L3MON4D3/LuaSnip",            version = "v2.*", build = "make install_jsregexp" },
	},

	config = function()
		local lsp = require('lsp-zero')
		lsp.extend_lspconfig()

		lsp.on_attach(function(_, bufnr)
			lsp.default_keymaps({ buffer = bufnr, remap = false })
		end)

		lsp.preset("recommended")

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"tsserver",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" }
								}
							}
						}
					}
				end,

			},
		})
		local cmp = require 'cmp'

		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
					vim.snippet.expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete({}),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				["<C-CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'vsnip' },
				{ name = 'luasnip' },
				{ name = 'buffer' },
				{ name = "codeium" },
			}),
			formatting = {
				format = require('lspkind').cmp_format({
					mode = 'symbol',
					maxwidth = 50,
					ellipsis_char = '...',
					show_labelDetails = true,
					symbol_map = { Codeium = "" },

					before = function(_, vim_item)
						return vim_item
					end
				})
			}
		})

		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		require('lspconfig')['rust_analyzer'].setup {
			capabilities = capabilities
		}
	end,
}

-- return {
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		dependencies = {
-- 			{ "williamboman/mason.nvim", config = true },
-- 			{ "williamboman/mason-lspconfig.nvim" },
--
-- 			{ "j-hui/fidget.nvim", opts = {} },
-- 			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
-- 			{ "folke/neodev.nvim", opts = {} },
-- 		},
-- 		config = function()
-- 			vim.api.nvim_create_autocmd("LspAttach", {
-- 				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
-- 				callback = function(event)
-- 					local map = function(keys, func, desc)
-- 						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
-- 					end
--
-- 					local builtin = require("telescope.builtin")
--
-- 					map("gd", builtin.lsp_definitions, "Go to definition")
-- 					map("gD", builtin.lsp_type_definitions, "Go to type definition")
-- 					map("gI", builtin.lsp_implementations, "Go to Implementation")
-- 					map("gA", builtin.lsp_references, "Go to All references to the current word")
-- 					map("cd", vim.lsp.buf.rename, "Rename (change definition)")
--
-- 					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
-- 					map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
--
-- 					map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
--
-- 					map("K", vim.lsp.buf.hover, "Hover Documentation")
-- 					map("gD", vim.lsp.buf.declaration, "Goto Declaration")
--
-- 					local client = vim.lsp.get_client_by_id(event.data.client_id)
-- 					if client and client.server_capabilities.documentHighlightProvider then
-- 						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
-- 						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
-- 							buffer = event.buf,
-- 							group = highlight_augroup,
-- 							callback = vim.lsp.buf.document_highlight,
-- 						})
--
-- 						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
-- 							buffer = event.buf,
-- 							group = highlight_augroup,
-- 							callback = vim.lsp.buf.clear_references,
-- 						})
--
-- 						vim.api.nvim_create_autocmd("LspDetach", {
-- 							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
-- 							callback = function(event2)
-- 								vim.lsp.buf.clear_references()
-- 								vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
-- 							end,
-- 						})
-- 					end
--
-- 					if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
-- 						map("<leader>th", function()
-- 							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
-- 						end, "Toggle Inlay Hints")
-- 					end
-- 				end,
-- 			})
--
-- 			local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
-- 			local servers = {
-- 				lua_ls = {
-- 					settings = {
-- 						Lua = {
-- 							completion = {
-- 								callSnippet = "Replace",
-- 							},
-- 						},
-- 					},
-- 				},
-- 				eslint = {
-- 					on_attach = function(_, bufnr)
-- 						vim.api.nvim_create_autocmd("BufWritePre", {
-- 							buffer = bufnr,
-- 							command = "EslintFixAll",
-- 						})
-- 					end,
-- 				},
-- 				volar = { filetypes = { "javascript", "typescript", "vue" } },
-- 			}
--
-- 			require("mason").setup()
--
-- 			local ensure_installed = vim.tbl_keys(servers or {})
-- 			vim.list_extend(ensure_installed, {
-- 				"rust_analyzer",
-- 				"gopls",
-- 				"golangci_lint_ls",
-- 				"tsserver",
-- 				"stylua",
-- 			})
-- 			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
--
-- 			require("mason-lspconfig").setup({
-- 				handlers = {
-- 					function(server_name)
-- 						local server = servers[server_name] or {}
-- 						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
-- 						require("lspconfig")[server_name].setup(server)
-- 					end,
-- 				},
-- 			})
-- 		end,
-- 	},
-- }
