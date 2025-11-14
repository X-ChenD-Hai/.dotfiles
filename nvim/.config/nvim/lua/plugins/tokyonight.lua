return {
    "folke/tokyonight.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        style = "night"
    },
    config = function(_,opt)
        require("tokyonight").setup(opt)
        vim.cmd("colorscheme tokyonight")
    end
}
