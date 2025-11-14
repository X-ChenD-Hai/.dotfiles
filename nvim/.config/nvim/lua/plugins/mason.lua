


return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    event = "VeryLazy",
    opts = {
        automatic_enable = {
            "lua_ls",
            "vimls"
        }
    },
}
