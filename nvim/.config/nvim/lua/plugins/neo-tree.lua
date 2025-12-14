-- ~/.config/nvim/lua/plugins/neo-tree.lua
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    keys = {
        { "<leader>fe", "<cmd>Neotree toggle<CR>", desc = "Explorer" },
        { "<A-e>",      "<cmd>Neotree toggle<CR>", desc = "Explorer" },
    },
    lazy = false,
    opts = {
        filesystem = {
            filtered_items = {
                visible = true, -- 默认显示隐藏文件
                hide_dotfiles = false,
            },
            follow_current_file = { enabled = true }, -- 自动跟随当前文件
        },
        window = {
            width = 35,
            -- position = "right",
        },
    },
}
