local clear_processes = require("modules.clear-processes")
local generate_editorconfig = require("modules.generate-editorconfig")

vim.api.nvim_create_user_command("ClearProcesses", function()
	clear_processes.clear_processes()
end, {})

vim.api.nvim_create_user_command("GenerateEditorconfig", function()
	generate_editorconfig.generate_editorconfig()
end, {})
