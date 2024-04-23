local wezterm = require 'wezterm'

local config = wezterm.config_builder()

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {
    position = { x = 450, y = 350, },
  })
end)

config = {
  color_scheme = 'GitHub Dark',
  font = wezterm.font("JetBrainsMono Nerd Font", { weight = "DemiBold" }),
  font_size = 15,
  initial_rows = 30,
  initial_cols = 120,
  adjust_window_size_when_changing_font_size = false,

  window_frame = {
    font_size = 15.0,
  }
}

return config
