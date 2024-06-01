require("core.base")
require("core.lazy")
require("core.highlights")
require("core.keymaps")

local has = vim.fn.has
local is_mac = has("macunix")
local is_win = has("win32")
local is_wsl = has("wsl")

if is_mac then
	require("core.macos")
end
if is_win then
	require("core.windows")
end
if is_wsl then
	require("core.wsl")
end
