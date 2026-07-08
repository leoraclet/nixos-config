local wezterm = require('wezterm')
local platform = require('utils.platform')
local act = wezterm.action

local mod = {}

if platform.is_mac then
    mod.SUPER = 'SUPER'
    mod.SUPER_REV = 'SUPER|CTRL'
elseif platform.is_win or platform.is_linux then
    mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
    mod.SUPER_REV = 'ALT|CTRL'
end

-- stylua: ignore
---@type Key[]
local keys = {
    -- copy/paste --
    { key = 'c',     mods = 'CTRL',        action = act.CopyTo('Clipboard') },
    { key = 'v',     mods = 'CTRL',        action = act.PasteFrom('Clipboard') },

    -- tabs --
    -- tabs: spawn+close
    { key = 'Enter', mods = mod.SUPER_REV, action = act.SpawnTab('DefaultDomain') },
    { key = 't',     mods = mod.SUPER,     action = act.SpawnTab('DefaultDomain') },
    { key = 'w',     mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = false }) },
    { key = 'w',     mods = 'CTRL',        action = act.CloseCurrentTab({ confirm = false }) },

    -- tabs: navigation
    { key = 'Tab',   mods = "CTRL",        action = act.ActivateTabRelative(1) },
    { key = 'Tab',   mods = "CTRL|SHIFT",  action = act.ActivateTabRelative(-1) },

    -- window --
    -- window: spawn windows
    { key = 'n',     mods = mod.SUPER,     action = act.SpawnWindow },

    -- panes --
    -- panes: split panes
    { key = 'Enter', mods = 'CTRL',        action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },

    -- panes: zoom+close pane
    { key = 'w',     mods = mod.SUPER,     action = act.CloseCurrentPane({ confirm = false }) },
    { key = 'w',     mods = 'CTRL',        action = act.CloseCurrentPane({ confirm = false }) },

    -- panes: navigation
    {
        key = 'LeftArrow',
        mods = 'CTRL|ALT',
        action = act.ActivatePaneDirection 'Left',
    },
    {
        key = 'RightArrow',
        mods = 'CTRL|ALT',
        action = act.ActivatePaneDirection 'Right',
    },
    {
        key = 'UpArrow',
        mods = 'CTRL|ALT',
        action = act.ActivatePaneDirection 'Up',
    },
    {
        key = 'DownArrow',
        mods = 'CTRL|ALT',
        action = act.ActivatePaneDirection 'Down',
    },

    -- Tabs
    { key = "1", mods = "ALT", action = act.ActivateTab(0) },
    { key = "2", mods = "ALT", action = act.ActivateTab(1) },
    { key = "3", mods = "ALT", action = act.ActivateTab(2) },
    { key = "4", mods = "ALT", action = act.ActivateTab(3) },
    { key = "5", mods = "ALT", action = act.ActivateTab(4) },
    { key = "6", mods = "ALT", action = act.ActivateTab(5) },
    { key = "7", mods = "ALT", action = act.ActivateTab(6) },
    { key = "8", mods = "ALT", action = act.ActivateTab(7) },
    { key = "9", mods = "ALT", action = act.ActivateTab(8) },
}

-- stylua: ignore
---@type table<string, Key[]>
local key_tables = {
    resize_font = {
        { key = 'k',      action = act.IncreaseFontSize },
        { key = 'j',      action = act.DecreaseFontSize },
        { key = 'r',      action = act.ResetFontSize },
        { key = 'Escape', action = 'PopKeyTable' },
        { key = 'q',      action = 'PopKeyTable' },
    },
    resize_pane = {
        { key = 'k',      action = act.AdjustPaneSize({ 'Up', 1 }) },
        { key = 'j',      action = act.AdjustPaneSize({ 'Down', 1 }) },
        { key = 'h',      action = act.AdjustPaneSize({ 'Left', 1 }) },
        { key = 'l',      action = act.AdjustPaneSize({ 'Right', 1 }) },
        { key = 'Escape', action = 'PopKeyTable' },
        { key = 'q',      action = 'PopKeyTable' },
    },
}

---@type MouseBinding[]
local mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = act.OpenLinkAtMouseCursor,
    },
}

---@type Config
return {
    disable_default_key_bindings = true,
    -- disable_default_mouse_bindings = true,
    leader = { key = 'Space', mods = mod.SUPER_REV },
    keys = keys,
    key_tables = key_tables,
    mouse_bindings = mouse_bindings,
}
