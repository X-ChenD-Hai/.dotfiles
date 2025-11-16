local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = { "pwsh.exe" }

config.font_size = 20
config.font = wezterm.font("CaskaydiaMono Nerd Font", {})
config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

config.color_scheme = "Catppuccin Mocha"

config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 0.6
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.default_cursor_style = 'BlinkingBlock'

config.window_background_gradient = {
    -- Can be "Vertical" or "Horizontal".  Specifies the direction
    -- in which the color gradient varies.  The default is "Horizontal",
    -- with the gradient going from left-to-right.
    -- Linear and Radial gradients are also supported; see the other
    -- examples below
    orientation = 'Vertical',

    -- Specifies the set of colors that are interpolated in the gradient.
    -- Accepts CSS style color specs, from named colors, through rgb
    -- strings and more
    colors = {
        '#0f0c29',
        '#302b63',
        '#24243e',
    },

    -- Instead of specifying `colors`, you can use one of a number of
    -- predefined, preset gradients.
    -- A list of presets is shown in a section below.
    -- preset = "Warm",

    -- Specifies the interpolation style to be used.
    -- "Linear", "Basis" and "CatmullRom" as supported.
    -- The default is "Linear".
    interpolation = 'Linear',

    -- How the colors are blended in the gradient.
    -- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
    -- The default is "Rgb".
    blend = 'Rgb',

    -- To avoid vertical color banding for horizontal gradients, the
    -- gradient position is randomly shifted by up to the `noise` value
    -- for each pixel.
    -- Smaller values, or 0, will make bands more prominent.
    -- The default value is 64 which gives decent looking results
    -- on a retina macbook pro display.
    -- noise = 64,

    -- By default, the gradient smoothly transitions between the colors.
    -- You can adjust the sharpness by specifying the segment_size and
    -- segment_smoothness parameters.
    -- segment_size configures how many segments are present.
    -- segment_smoothness is how hard the edge is; 0.0 is a hard edge,
    -- 1.0 is a soft edge.

    -- segment_size = 11,
    -- segment_smoothness = 0.0,
}


wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local bg = tab.is_active and "#2b2042" or "#1b1032"
    local fg = "#ffffff"
    local edge_bg = "#0b0022"
    local edge_fg = bg

    local left_edge = wezterm.format {
        { Background = { Color = edge_bg } },
        { Foreground = { Color = edge_fg } },
        { Text = wezterm.nerdfonts.pl_right_hard_divider },
    }
    local right_edge = wezterm.format {
        { Background = { Color = edge_bg } },
        { Foreground = { Color = edge_fg } },
        { Text = wezterm.nerdfonts.pl_left_hard_divider },
    }

    local title = " " .. tab.active_pane.title .. " "

    return {
        { Background = { Color = bg } },
        { Foreground = { Color = fg } },
        { Text = left_edge .. title .. right_edge },
    }
end)


config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
local act = wezterm.action

local active_pane = {
    {
        key = '|',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '_',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'x',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    { key = 'h',          mods = 'LEADER', action = act.ActivatePaneDirection 'Left', },
    { key = 'LeftArrow',  mods = 'LEADER', action = act.ActivatePaneDirection 'Left', },
    { key = 'j',          mods = 'LEADER', action = act.ActivatePaneDirection 'Down', },
    { key = 'DownArrow',  mods = 'LEADER', action = act.ActivatePaneDirection 'Down', },
    { key = 'k',          mods = 'LEADER', action = act.ActivatePaneDirection 'Up', },
    { key = 'UpArrow',    mods = 'LEADER', action = act.ActivatePaneDirection 'Up', },
    { key = 'l',          mods = 'LEADER', action = act.ActivatePaneDirection 'Right', },
    { key = 'RightArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Right', },
}

local debug_keys = {
    {
        key = 'L',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ShowDebugOverlay
    },
}

local tab_keys = {
    {
        key = 'c',
        mods = 'LEADER',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
}

for i = 1, 9 do
    tab_keys[#tab_keys + 1] = { key = string.format('%d', i), mods = 'LEADER', action = wezterm.action.ActivateTab(i - 1), }
end


config.keys = {
    {
        key = 'F11',
        action = wezterm.action.ToggleFullScreen,
    },
    {
        key = 'r',
        mods = 'LEADER',
        action = act.ActivateKeyTable {
            name = 'resize_pane',
            one_shot = false,
        },
    },
    --   { key = '/', action = wezterm.action.Search { CaseSensitiveString = "" }, },
    --    { key = '[',         mods = 'LEADER',       action = wezterm.action.ActivateCopyMode, },
    --    { key = 'UpArrow', mods = 'SHIFT|CTRL',                                         action = wezterm.action.ScrollToPrompt(-1) },
    --   { key = 'DownArrow', mods = 'SHIFT|CTRL',   action = wezterm.action.ScrollToPrompt(1) },
}
local function insert_to(dst, src)
    for _, v in ipairs(src) do
        dst[#dst + 1] = v
    end
end
insert_to(config.keys, tab_keys)
insert_to(config.keys, active_pane)
insert_to(config.keys, debug_keys)


-- print(config.keys)

local resize_pane = {
    { key = 'LeftArrow',  action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h',          action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l',          action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'UpArrow',    action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k',          action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'DownArrow',  action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j',          action = act.AdjustPaneSize { 'Down', 1 } },

    -- Cancel the mode by pressing escape
    { key = 'Escape',     action = 'PopKeyTable' },
    table.unpack(active_pane),
}


-- local copy_mode_additional_keys = {
--     { key = 'z', mods = 'SHIFT', action = wezterm.action.CopyMode 'MoveBackwardSemanticZone' },
--     { key = 'z', mods = 'NONE',  action = wezterm.action.CopyMode 'MoveForwardSemanticZone' },
--     { key = '[', mods = 'CTRL',  action = wezterm.action.CopyMode 'Close' },
--     { key = '/', mods = 'NONE',  action = wezterm.action.Search { CaseSensitiveString = "" }, },
-- }
--
-- local copy_mode = wezterm.gui.default_key_tables().copy_mode
-- for _, key in ipairs(copy_mode_additional_keys) do
--     table.insert(copy_mode, key)
-- end
--
-- local search_mode_additional_keys = {
--     { key = '[', mods = 'CTRL', action = wezterm.action.CopyMode 'AcceptPattern' },
-- }
-- local search_mode = wezterm.gui.default_key_tables().search_mode
-- for _, key in ipairs(search_mode_additional_keys) do
--     table.insert(search_mode, key)
-- end


config.key_tables = {
    -- copy_mode = copy_mode,
    -- search_mode = search_mode,
    resize_pane = resize_pane,
}


return config
