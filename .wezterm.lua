local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- local mux = wezterm.mux

config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "Tokyo Night"

config.font_size = 14

config.window_decorations = "NONE"

config.default_cursor_style = "BlinkingBlock"

config.cursor_blink_rate = 500

return config
