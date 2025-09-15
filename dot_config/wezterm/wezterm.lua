-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- This will hold the configuration.local
config = wezterm.config_builder()


-- This is where you actually apply your config choices
-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

-- because I don't know the path for nu on linux yet lmao
local out = '/bin/bash'

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    out = 'C:\\Users\\anton\\AppData\\Local\\Programs\\nu\\bin\\nu.exe'
elseif wezterm.target_triple == 'aarch64-apple-darwin' or wezterm.target_triple == 'aarch64-apple-darwin' then
    out = '/opt/homebrew/bin/nu'
end

config.default_prog = { out }


-- and finally, return the configuration to wezterm


local act = wezterm.action
config.leader = {
    key = "w",
    mods = "CTRL",
    timeout_milliseconds = math.maxinteger,
}
config.keys = {
    {
        key = "h",
        mods = "LEADER",
        action = act.ActivatePaneDirection("Left"),
    },
    {
        key = "j",
        mods = "LEADER",
        action = act.ActivatePaneDirection("Down"),
    },
    {
        key = "k",
        mods = "LEADER",
        action = act.ActivatePaneDirection("Up"),
    },
    {
        key = "l",
        mods = "LEADER",
        action = act.ActivatePaneDirection("Right"),
    },
    {
        key = "-",
        mods = "LEADER",
        action = act.ActivatePaneDirection("Right"),
    },
    {
        key = "x",
        mods = "LEADER",
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    {
        key = "v",
        mods = "LEADER",
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
    },
    {
        key = "s",
        mods = "LEADER",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
    },
    {
        key = 'P',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.DisableDefaultAssignment
    },
    {
        key = 'P',
        mods = 'ALT',
        action = act.ActivateCommandPalette
    },
}
return config
