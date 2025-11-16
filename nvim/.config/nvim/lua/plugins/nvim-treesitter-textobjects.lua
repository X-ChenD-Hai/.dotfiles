return { {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufReadPost",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("nvim-treesitter.configs").setup {
            textobjects = {
                select = {
                    enable = true,
                    keymaps = {
                        -- 把缩进块映射到 ai/ii
                        ["ai"] = "@indent.outer",
                        ["ii"] = "@indent.inner",
                    },
                },
            },
        }
    end,
} }
