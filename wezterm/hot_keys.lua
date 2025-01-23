local wezterm = require 'wezterm'

local lib = {}


lib.leader = {
    key = 'a',
    mods = 'CTRL',
    timeout_milliseconds = 1000,
}

lib.keys = {

    -- Sends ESC + b and ESC + f sequence, which is used
    -- for telling your shell to jump back/forward.
    {
        key = 'LeftArrow',
        mods = 'OPT',
        action = wezterm.action.SendString '\x1bb',
    },
    {
        key = 'RightArrow',
        mods = 'OPT',
        action = wezterm.action.SendString '\x1bf',
    },
    {
        key = 'h',
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'v',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = false },
    }
}

return lib