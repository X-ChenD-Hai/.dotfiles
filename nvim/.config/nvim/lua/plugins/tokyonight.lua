return {
    "folke/tokyonight.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    lazy = false, -- 早期加载，避免重复刷颜色
    -- enabled = false,
    priority = 1000,
    opts = {
        style = "night",
        transparent = true,
        on_colors = function(colors)
            colors.comment = colors.green
        end,
        on_highlights = function(hl, c,cc)
            -- 修改行号颜色
            hl.LineNr.fg = c.green    -- 行号文字颜色，使用主题蓝色
            hl.LineNrAbove.fg = c.blue
            hl.LineNrBelow.fg = c.blue
            hl.DiagnosticUnnecessary.fg = c.fg_dark  
        end,
    },
    config = function(_, opt)
        require("tokyonight").setup(opt)
        vim.cmd.colorscheme "tokyonight"
    end
}
