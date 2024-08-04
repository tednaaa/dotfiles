require("core.settings")
require("core.keymaps")
require("core.autocmd")

local clear_processes = require("modules.clear-processes")
local generate_editorconfig = require("modules.generate-editorconfig")

vim.api.nvim_create_user_command("ClearProcesses", function()
	clear_processes.clear_processes()
end, {})

vim.api.nvim_create_user_command("GenerateEditorconfig", function()
	generate_editorconfig.generate_editorconfig()
end, {})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	change_detection = {
		enabled = false,
		notify = false,
	},
})
