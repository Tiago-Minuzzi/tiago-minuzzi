-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local mux = wezterm.mux

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Dracula"

config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "RESIZE"
config.window_frame = {
	font_size = 10,
	active_titlebar_bg = "#282c34",
}

config.keys = {
	{
		key = "s",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

local padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = "0.5cell",
	bottom = "0.5cell",
}

wezterm.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if string.find(pane:get_title(), "^n-vi-m-.*") then
		overrides.window_padding = {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0,
		}
	else
		overrides.window_padding = padding
	end
	window:set_config_overrides(overrides)
end)
-- and finally, return the configuration to wezterm
return config
