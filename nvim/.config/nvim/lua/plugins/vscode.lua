-- 使用 lazy.nvim
return { {
    'Mofiqul/vscode.nvim',
    enabled = false,
    config = function()
        local opts = {
            italic_comments = true,
        }
        require("vscode").setup(opts)
        vim.cmd('colorscheme vscode')
    end
} }
