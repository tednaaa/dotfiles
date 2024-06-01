return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-ui-select.nvim",
		"tom-anders/telescope-vim-bookmarks.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-lua/plenary.nvim",
	},
	opts = {
		defaults = {
			layout_config = { height = 0.95, width = 0.95 },
			dynamic_preview_title = true,
		},
	},
	config = function()
		local status, telescope = pcall(require, "telescope")
		if not status then
			return
		end
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		local function telescope_buffer_dir()
			return vim.fn.expand("%:p:h")
		end

		local fb_actions = require("telescope").extensions.file_browser.actions

		telescope.setup({
			defaults = {
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = false,
					}
				},
				file_ignore_patterns = {
					"node_modules",
					".git",
				},
				mappings = {
					n = { ["q"] = actions.close }
				},
			},

			extensions = {
				file_browser = {
					theme = "dropdown",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						-- your custom insert mode mappings
						["i"] = {
							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
						["n"] = {
							-- your custom normal mode mappings
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
						},
					},
				},
			},
		})

		telescope.load_extension("file_browser")

		vim.keymap.set("n", ";f", function()
			builtin.find_files({
				no_ignore = false,
				hidden = true,
			})
		end, { desc = "Find Files" })
		vim.keymap.set("n", ";r", function()
			builtin.live_grep({ default_text = vim.fn.expand('<cword>') })
		end, { desc = "Live Grep" })
		vim.keymap.set("n", "\\\\", function()
			builtin.buffers()
		end, { desc = "Buffers" })
		vim.keymap.set("n", ";t", function()
			builtin.help_tags()
		end, { desc = "Help Tags" })
		vim.keymap.set("n", ";;", function()
			builtin.resume()
		end, { desc = "Resume" })
		vim.keymap.set("n", ";e", function()
			builtin.diagnostics()
		end, { desc = "Diagnostics" })
		vim.keymap.set("n", "sf", function()
			telescope.extensions.file_browser.file_browser({
				path = "%:p:h",
				cwd = telescope_buffer_dir(),
				respect_gitignore = false,
				hidden = true,
				grouped = true,
				previewer = false,
				initial_mode = "normal",
				layout_config = { height = 40 },
			})
		end, { desc = "File Browser" })
	end,
}
