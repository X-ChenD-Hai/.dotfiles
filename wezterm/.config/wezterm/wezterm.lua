local wezterm = require("wezterm")
local config = wezterm.config_builder()
package.path = package.path .. ";~/.config/wezterm/%.lua"

require("launch")(config, wezterm)

config.font_size = 20
config.font = wezterm.font("CaskaydiaMono Nerd Font", {})
config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

config.default_cursor_style = 'BlinkingBlock'

-- VSCode Modern Dark 风格
config.color_scheme = "One Dark"

-- 背景颜色 (使用渐变单色)
config.window_background_gradient = {
    colors = { "#1f1f1f" },
}

-- config.window_decorations = "RESIZE|TITLE"
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false

-- 窗口内边距
config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
}

-- 标签栏
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local bg = "#1f1f1f"
    local fg = "#cccccc"
    local green = "#4ec9b0"

    -- 激活tab加绿色➜
    local icon = "➜"
    local title = " " .. tab.active_pane.title .. " "

    if tab.is_active then
        return {
            { Background = { Color = bg } },
            { Foreground = { Color = green } },
            { Text = icon },
            { Foreground = { Color = fg } },
            { Text = title },
        }
    else
        return {
            { Background = { Color = bg } },
            { Foreground = { Color = fg } },
            { Text = title },
        }
    end
end)

require("keymap")(config, wezterm)

config.color_scheme_dirs = { "~/.config/wezterm/colors" }

config.use_ime = true

return config
