


return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = {
        automatic_enable = {
            "lua_ls",
            "vimls"
        }
    },
}
