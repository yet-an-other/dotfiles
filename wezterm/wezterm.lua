local wezterm = require 'wezterm'
local right_status = require 'right_status'
local palette = require 'palette'
local tab_bar = require 'tab_bar'
local hot_keys = require 'hot_keys'

local config = wezterm.config_builder()

-- wezterm.log_info()

config.color_scheme = palette.color_scheme_name
config.font_size = 13
config.default_cursor_style = 'BlinkingUnderline'
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
config.window_decorations = 'RESIZE' -- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice 

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_max_width = 25
config.show_tab_index_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.show_new_tab_button_in_tab_bar = false

-- default colors for tab bar (needed to disable italic on hover)
-- https://wezfurlong.org/wezterm/config/appearance.html#retro-tab-bar-appearance
--
config.colors = {
    tab_bar = {
      background = palette.common_bg,
      inactive_tab_hover = {
        bg_color = palette.common_bg,
        fg_color = palette.inactive_fg,
        italic = false,      
      },
    },
  }

-- dim the inactive pane
--
config.inactive_pane_hsb = {
    saturation = 0.6,
    brightness = 0.6
}

-- right status
--
wezterm.on('update-status', right_status.set_right_status)

-- tab bar
--
wezterm.on("format-tab-title", tab_bar.format_tab)

-- leader key CTRL + A
--
config.leader = hot_keys.leader

-- Table mapping keypresses to actions
--
config.keys = hot_keys.keys

return config
