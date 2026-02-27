return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    -- Only load when opening markdown files in vault
    event = {
        "BufReadPre ~/vaults/personal/*.md",
        "BufNewFile ~/vaults/personal/*.md",
    },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        -- 只在vault存在时配置workspace
        workspaces = {
            {
                name = "personal",
                path = vim.fn.expand("~/vaults/personal"),
            },
        },

        -- see below for full list of options 👇
    },
}
