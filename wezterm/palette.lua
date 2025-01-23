local wezterm = require 'wezterm'

-- config.color_scheme = 'Default (dark) (terminal.sexy)'
--  config.color_scheme = 'Catppuccin Mocha (Gogh)'
local color_scheme_name = 'Tango (terminal.sexy)'
local color_scheme = wezterm.get_builtin_color_schemes()[color_scheme_name]

-- defines color scheme name and color scheme for a top status bar
--
return {
    color_scheme_name = color_scheme_name,
    nerdfonts = wezterm.nerdfonts,

    active_bg = color_scheme.background,
    active_fg = color_scheme.ansi[4],
    inactive_bg = color_scheme.ansi[1],
    inactive_fg = '#707070',--color_scheme.brights[1]
    common_bg = color_scheme.ansi[1],
    common_fg = color_scheme.ansi[8],
}