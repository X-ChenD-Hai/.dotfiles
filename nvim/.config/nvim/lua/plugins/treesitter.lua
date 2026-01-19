return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "lua",
            "toml",
            "cpp",
            "c",
            "tsx",
            "javascript",
            "typescript",
            "python",
            "rust",
            "markdown",
        },
        highlight = {
            enable = true,
        },
        autotag = {
            enable = true,
            enable_rename = true,
            enable_close = true,
            enable_close_on_slash = true,
            filetypes = {
                "html", "xml", "javascript", "typescript", "javascriptreact",
                "typescriptreact", "svelte", "vue", "tsx", "jsx", "rescript",
                "php", "markdown", "glimmer", "handlebars", "hbs", "htmldjango",
            },
        },
    }
}
