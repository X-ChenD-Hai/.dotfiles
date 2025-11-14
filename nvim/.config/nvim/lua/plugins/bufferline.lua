return {
    "akinsho/bufferline.nvim",
    lazy = false,
    opts = {
        options = {
            -- 关键：启用 lsp 诊断
            diagnostics = 'nvim_lsp', -- 也可选 'coc'
            -- 让诊断在 Insert 模式也更新（可选）
            diagnostics_update_in_insert = false,
            -- 自定义图标 + 数量
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match('error') and ' ' or ' '
                return ' ' .. icon .. count
            end,
        },
    },
    keys = {
        { "<leader>bj", ":BufferLineCycleNext<CR>", silent = true },
        { "<leader>bk", ":BufferLineCyclePrev<CR>", silent = true },
        { "<leader>bp", ":BufferLinePick<CR>",      silent = true },
        { "<leader>bd", ":bdelete<CR>",             silent = true },
    }
}
