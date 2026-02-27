-- lazygit.nvim - LazyGit integration for Neovim
return {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
        { "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "Open LazyGit for current file" },
    },
}
