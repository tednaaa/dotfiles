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
		require('lspconfig')['rust_analyzer'].setup({ capabilities = capabilities })
	end,
}
