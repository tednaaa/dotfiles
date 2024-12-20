return {
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<A-a>",
					clear_suggestion = "<A-c>",
					accept_word = "<A-j>",
				},
			})
		end,
	},

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = { library = { { path = "luvit-meta/library", words = { "vim%.uv" } } } },
	},
	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init({ preset = "codicons" })
		end,
	},

	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = "rafamadriz/friendly-snippets",
		version = "v0.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<CR>"] = { "select_and_accept" },

				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
			},

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release
				-- use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, via `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				-- optionally disable cmdline completions
				-- cmdline = {},
			},

			-- experimental signature help support
			-- signature = { enabled = true }
		},
		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },
	},

	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {
	-- 		{ "hrsh7th/cmp-buffer" },
	-- 		{ "hrsh7th/cmp-path" },
	-- 		{ "hrsh7th/cmp-cmdline" },
	-- 		{ "hrsh7th/cmp-nvim-lsp" },
	-- 		{ "hrsh7th/cmp-nvim-lua" },
	--
	-- 		{ "saadparwaiz1/cmp_luasnip" },
	-- 		{ "rafamadriz/friendly-snippets" },
	-- 		{ "L3MON4D3/LuaSnip",            version = "v2.*", build = "make install_jsregexp" },
	-- 	},
	-- 	opts = function(_, opts)
	-- 		opts.sources = opts.sources or {}
	-- 		table.insert(opts.sources, { name = "lazydev", group_index = 0 })
	-- 	end,
	-- 	config = function()
	-- 		local cmp = require("cmp")
	-- 		local luasnip = require("luasnip")
	--
	-- 		require("luasnip.loaders.from_vscode").lazy_load()
	--
	-- 		cmp.setup({
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
	-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- 				["<C-Space>"] = cmp.mapping.complete({}),
	-- 				["<CR>"] = cmp.mapping.confirm({ select = true }),
	-- 			}),
	-- 			completion = { completeopt = "menu,menuone,preview,noselect" },
	-- 			---@diagnostic disable-next-line: missing-fields
	-- 			performance = { debounce = 0, throttle = 0 },
	-- 			snippet = {
	-- 				expand = function(args)
	-- 					luasnip.lsp_expand(args.body)
	-- 				end,
	-- 			},
	-- 			---@diagnostic disable-next-line: missing-fields
	-- 			formatting = {
	-- 				fields = { "kind", "abbr", "menu" },
	--
	-- 				format = function(entry, item)
	-- 					local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
	--
	-- 					item = require("lspkind").cmp_format({
	-- 						mode = "symbol",
	-- 						maxwidth = 20,
	-- 						ellipsis_char = "...",
	-- 						show_labelDetails = true,
	--
	-- 						before = function()
	-- 							if entry.completion_item.detail ~= nil and entry.completion_item.detail ~= "" then
	-- 								item.menu = entry.completion_item.detail
	-- 							end
	-- 							return item
	-- 						end,
	-- 					})(entry, item)
	-- 					if color_item.abbr_hl_group then
	-- 						item.kind_hl_group = color_item.abbr_hl_group
	-- 						item.kind = color_item.abbr
	-- 					end
	-- 					return item
	-- 				end,
	-- 			},
	-- 			sources = {
	-- 				{ name = "nvim_lsp" },
	-- 				{ name = "path" },
	-- 				{ name = "luasnip" },
	-- 				{ name = "buffer" },
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
