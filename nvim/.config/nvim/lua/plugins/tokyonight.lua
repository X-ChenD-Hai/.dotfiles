return {
    "folke/tokyonight.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    lazy = false, -- 早期加载，避免重复刷颜色
    priority = 1000,
    opts = {
        style = "night",
        transparent = true,
    },
    config = function(_, opt)
        require("tokyonight").setup(opt)
        vim.cmd.colorscheme "tokyonight"
    end
}
