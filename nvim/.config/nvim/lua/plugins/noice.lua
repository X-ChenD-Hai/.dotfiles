-- ~/.config/nvim/lua/plugins/noice.lua
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
        views = {
            cmdline_popup = {
                position = {
                    row = 5,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                },
            },
            popupmenu = {
                relative = "editor",
                position = {
                    row = 8,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = 10,
                },
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
                },
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                },
            },
        },
        messages = { enabled = false }, -- 可选：禁用底部消息
    },
    keys = {

        { '<leader>nc', ':Noice dismiss<Cr>', silent = true },
        { '<A-c>',      ':Noice dismiss<Cr>', silent = true },
    }
}
