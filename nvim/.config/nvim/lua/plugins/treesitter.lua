return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    main = "nvim-treesitter.config",
    opt = {
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
