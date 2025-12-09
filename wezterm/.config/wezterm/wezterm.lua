local wezterm = require("wezterm")
local config = wezterm.config_builder()
package.path = package.path .. ";~/.config/wezterm/%.lua"

require("launch")(config, wezterm)

config.font_size = 20
config.font = wezterm.font("CaskaydiaMono Nerd Font", {})
config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

config.color_scheme = "Catppuccin Mocha"

-- config.window_decorations = "RESIZE|TITLE"
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.5
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
-- config.win32_system_backdrop = 'Acrylic'
-- config.default_cursor_style = 'BlinkingBlock'
-- 背景渐变
local window_background_gradient = {
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
-- 渐变控制
config.window_background_gradient=window_background_gradient;
-- 标签栏
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local bg = tab.is_active and "#2b2042" or "#1b1032"
    -- local bg = "#ffffff"
    local fg = "#ffffff"
    local edge_bg = "#0b0022"
    local edge_fg = bg
    --
    -- local left_edge = wezterm.format {
    --     { Background = { Color = edge_bg } },
    --     { Foreground = { Color = edge_fg } },
    --     { Text = wezterm.nerdfonts.pl_right_hard_divider },
    -- }
    -- local right_edge = wezterm.format {
    --     { Background = { Color = edge_bg } },
    --     { Foreground = { Color = edge_fg } },
    --     { Text = wezterm.nerdfonts.pl_left_hard_divider },
    -- }
    -- --
    local title = " " .. tab.active_pane.title .. " "

    local title_text = wezterm.format {
        { Background = { Color = bg } },
        { Foreground = { Color = fg } },
        { Text = title },
    }
    -- local basic_format = wezterm.format {
    --     { Background = { Color = bg } },
    --     { Foreground = { Color = fg } },
    --     { Text = "" },
    -- }
    --
    --
    return {
        { Background = { Color = bg } },
        { Foreground = { Color = fg } },
        { Text = title }
    }
end)

require("keymap")(config, wezterm)

config.color_scheme_dirs = { "~/.config/wezterm/colors" }
-- config.color_scheme = "Everforest Dark (Medium)"

return config
