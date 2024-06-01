-- from https://github.com/scottmckendry/windots/blob/main/nvim/lua/plugins/alpha.lua
return {
	"goolord/alpha-nvim",
	lazy = false,
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local logo = [[
			████████╗███████╗██████╗ ███╗   ██╗ █████╗
			╚══██╔══╝██╔════╝██╔══██╗████╗  ██║██╔══██╗
				 ██║   █████╗  ██║  ██║██╔██╗ ██║███████║
				 ██║   ██╔══╝  ██║  ██║██║╚██╗██║██╔══██║
				 ██║   ███████╗██████╔╝██║ ╚████║██║  ██║
				 ╚═╝   ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝
			]]

		dashboard.section.header.val = vim.split(logo, "\n")
		dashboard.section.buttons.val = {
			dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button(";f", " " .. " Find file", ":Telescope find_files <CR>"),
			dashboard.button(";r", " " .. " Live grep", ":Telescope live_grep <CR>"),
			dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
		}

		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.footer.opts.hl = "AlphaFooter"
		dashboard.opts.layout[1].val = 10
		return dashboard
	end,
	config = function(_, dashboard)
		require("alpha").setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				local version = "󰥱 v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
				local plugins = "⚡ loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				local footer = "\t" .. version .. "\t" .. plugins .. "\n\n" .. "\n\n"
				dashboard.section.footer.val = footer
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
