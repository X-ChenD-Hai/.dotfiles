return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "lua",
            "toml",
            "cpp",
            "c",
            "python",
            "rust",
            "markdown",
        },
        highlight = {
            enable = true,
        },
    }
}
