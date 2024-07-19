local wezterm = require("wezterm")

wezterm.on("gui-startup", function()
	local _, _, window = wezterm.mux.spawn_window({})
	window:gui_window():maximize()
end)

-- TODO: still not working
-- wezterm.on("exit", function()
-- 	os.execute("killall prettierd eslint_d")
-- end)

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
	config:set_strict_mode(true)
end

config.window_padding = {
	left = "0",
	right = "0",
	top = "0",
	bottom = "0",
}

config.color_scheme = "GitHub Dark"

-- config.background = {
-- 	{
-- 		source = {
-- 			File = "Users/tedna/Pictures/wallpaper.jpg",
-- 		},
-- 		height = "100%",
-- 		width = "100%",
-- 		hsb = { brightness = 0.005 },
-- 	},
-- }

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 14
config.line_height = 1.3
config.adjust_window_size_when_changing_font_size = false
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.window_frame = {
	font_size = 15.0,
}

local act = wezterm.action
config.leader = {
	key = "a",
	mods = "CTRL",
}
config.keys = {
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
}

return config
