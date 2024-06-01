return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("go").setup({
			go = "go",
			goimports = "gopls",
			fillstruct = "gopls",
			gofmt = "gofumpt",
			tag_transform = false,
			comment_placeholder = "",
			verbose = true,
			lsp_cfg = true,
			lsp_gofumpt = true,
			lsp_diagnostic_underline = true,
			lsp_on_attach = function(_, _) end,
			lsp_codelens = true,
			lsp_keymaps = true,
			lsp_diagnostic_hdlr = true,
			lsp_diagnostic_signs = true,
			lsp_diagnostic_update_in_insert = true,
			enable = true,
			only_current_line = false,
			only_current_line_autocmd = "CursorHold",
			show_variable_name = true,
			max_len_align = false,
			max_len_align_padding = 1,
			right_align = false,
			right_align_padding = 6,
			highlight = "Comment",
			lsp_inlay_hints = {
				enable = true,
				style = 'eol',
				only_current_line = false,
				only_current_line_autocmd = "CursorHold",
				show_variable_name = true,
				parameter_hints_prefix = "󰊕 ",
				show_parameter_hints = true,
				other_hints_prefix = "=> ",
				max_len_align = false,
				max_len_align_padding = 1,
				right_align = false,
				right_align_padding = 6,
				highlight = "Comment",
			},
		})
		-- gopls_remote_auto = true      -- add -remote=auto to gopls
		-- gocoverage_sign = "█"
		-- dap_debug = false,            -- set to false to disable dap
		-- dap_debug_keymap = false,     -- true: use keymap for debugger defined in go/dap.lua
		-- false: do not use keymap in go/dap.lua.  you must define your own.
		-- dap_debug_gui = false,        -- set to true to enable dap gui, highly recommended
		-- dap_debug_vt = false,         -- set to true to enable dap virtual text
		-- build_tags = "",              -- set default build tags
		-- textobjects = true,           -- enable default text jobects through treesittter-text-objects
		-- test_runner = "go",           -- richgo, go test, richgo, dlv, ginkgo
		-- run_in_floaterm = false,      -- set to true to run in float window.
		-- float term recommended if you use richgo/ginkgo with terminal color
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
