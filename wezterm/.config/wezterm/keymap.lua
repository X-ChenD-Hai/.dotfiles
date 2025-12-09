return function(config,wezterm)
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
        tab_keys[#tab_keys + 1] = { key = string.format('%d', i), mods = 'LEADER', action = wezterm.action.ActivateTab(i -
        1), }
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
        { key = "d", mods = "CTRL", action = act.SendString 'exit\r' },
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


    config.key_tables = {
        resize_pane = resize_pane,
    }
end
