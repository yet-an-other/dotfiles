local wezterm = require 'wezterm'
local common = require 'common'
local palette = require 'palette'
local lib = {}

function lib.set_right_status(window, pane)

    window:set_right_status(wezterm.format({
        { Background = { Color = palette.common_bg  } },
        { Foreground = { Color = palette.active_bg } },
        { Text = palette.nerdfonts.ple_lower_right_triangle },
        { Background = { Color = palette.active_bg } },
        { Foreground = { Color = palette.common_fg  } },
        { Text = ' ' .. common.get_process(pane) .. ' ' },
        -- { Text = ' ' .. wezterm.hostname() .. ' ' },
    }))
    
end

return lib
