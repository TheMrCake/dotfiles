-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- This will hold the configuration.local
config = wezterm.config_builder()

 
-- This is where you actually apply your config choices
-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.default_prog = { 'C:\\ProgramData\\chocolatey\\bin\\nu.exe' }

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
        key = "h",
        mods = "LEADER",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
    },
}
return config
