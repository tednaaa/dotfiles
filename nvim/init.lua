require("core.settings")
require("core.keymaps")
require("core.autocmd")

local clear_processes = require("modules.clear-processes")

vim.api.nvim_create_user_command("ClearProcesses", function()
	clear_processes.clear_processes()
end, {})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	change_detection = {
		enabled = false,
		notify = false,
	},
})
