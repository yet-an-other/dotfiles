local wezterm = require 'wezterm'
local palette = require 'palette'
local common = require 'common'

local mux = wezterm.mux
local nerdfonts = palette.nerdfonts
local lib = {}

local is_prev_tab_active = false
function lib.format_tab(tab, tabs, panes, config, hover, max_width)

    icon = nerdfonts.oct_terminal
    if common.get_process(mux.get_pane(tab.active_pane.pane_id)) == 'ssh' then
        icon = nerdfonts.md_lan_connect
    end

    local tabstyle = wezterm.format(get_tab_prefix(tab.is_active, is_prev_tab_active, tab.tab_index == 0))
    tabstyle = tabstyle .. wezterm.format(get_tab_text(tab.is_active, icon, tab)) -- nerdfonts.fa_terminal
    tabstyle = tabstyle .. wezterm.format(get_tab_index(tab.is_active, tostring(tab.tab_index + 1), tab.tab_index == #tabs - 1))

    if tab.is_active then
      is_prev_tab_active = true
    else
      is_prev_tab_active = false
    end
        
    return tabstyle
end


-- retruns formattd prefix for tab (which is actually a suffix of previous tab)
--
function get_tab_prefix(is_active, is_prev_tab_active, is_first)
    if is_first then
        if is_active then
            return {
                { Background = { Color = palette.active_bg }                 },
                { Foreground = { Color = palette.active_bg }                 },
                { Text       = nerdfonts.ple_right_half_circle_thick },
            }
        else
            return {
                { Background = { Color = palette.inactive_bg } },
                { Foreground = { Color = palette.inactive_bg } },
                { Text       = nerdfonts.ple_right_half_circle_thick },
            }
        end
    end

    if is_prev_tab_active then
        return {
            { Background = { Color = palette.active_bg } },
            { Foreground = { Color = palette.active_fg } },
            { Text       = nerdfonts.ple_right_half_circle_thick },
        }
    else
        if is_active then
            return {
                { Background = { Color = palette.active_bg } },
                { Foreground = { Color = palette.inactive_fg } },
                { Text       = nerdfonts.ple_right_half_circle_thick },
            }
        else
            return {
                { Background = { Color = palette.inactive_bg } },
                { Foreground = { Color = palette.inactive_fg } },
                { Text       = nerdfonts.ple_right_half_circle_thick },
            }
        end
    end
end

-- returns formatted text of a tab
--
function get_tab_text(is_active, icon, tab_info)
    local title = tab_info.tab_title
    if not title or #title == 0 then
        title = tab_info.active_pane.title
    end
    title = " " .. icon .. " " .. title .. " "

    if is_active then
        return {
            { Background = { Color = palette.active_bg } },
            { Foreground = { Color = palette.active_fg } },
            { Text       = title },
        }
    else
        return {
            { Background = { Color = palette.inactive_bg } },
            { Foreground = { Color = palette.inactive_fg } },
            { Text       = title },
        }
    end
end

-- returns formatted tab index
--
function get_tab_index(is_active, tab_number, is_last)
    local tn_style = {}
    if is_active then
        tn_style = {
            { Background = { Color = palette.active_fg } },
            { Foreground = { Color = palette.active_bg } },
            { Text       = " " .. tab_number },
        }
    else
        tn_style = {
            { Background = { Color = palette.inactive_fg } },
            { Foreground = { Color = palette.inactive_bg } },
            { Text       = " " .. tab_number },
        }
    end

    if is_last then
        if is_active then
            table.insert(tn_style, { Background = { Color = palette.common_bg } })
            table.insert(tn_style, { Foreground = { Color = palette.active_fg } })
            table.insert(tn_style, { Text       = nerdfonts.ple_right_half_circle_thick })
        else
            table.insert(tn_style, { Background = { Color = palette.common_bg } })
            table.insert(tn_style, { Foreground = { Color = palette.inactive_fg } })
            table.insert(tn_style, { Text       = nerdfonts.ple_right_half_circle_thick })
        end
    end
    return tn_style
end

return lib