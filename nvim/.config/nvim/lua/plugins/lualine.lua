-- ~/.config/nvim/lua/plugins/lualine.lua
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    opts = {
        options = {
            theme                = 'gruvbox', -- 主题可换：auto/onedark/tokyonight
            component_separators = { left = '', right = '' },
            section_separators   = { left = '', right = '' },
            globalstatus         = true,                 -- 全局一条栏（nvim-0.7+）
            refresh              = { statusline = 200 }, -- 200 ms 刷新，省电
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            -- lualine_y = { 'progress' },
            lualine_y = {
                {
                    function()
                        if not vim.g.loaded_xmake then return "" end
                        local Info = require("xmake.info")
                        if Info.mode.current == "" then return "" end
                        if Info.target.current == "" then return "Xmake: Not Select Target" end
                        return ("%s(%s)"):format(Info.target.current, Info.mode.current)
                    end,
                    cond = function()
                        return vim.o.columns > 100
                    end,
                }
            },
            lualine_z = { 'location' }
        },
        inactive_sections = {
            lualine_c = { 'filename' }, -- 非当前窗口简化显示
            lualine_x = { 'location' },
        },
    },
}
