vim.lsp.config['clangd'] = {
    -- cmd = { 'clangd', '--background-index', '--compile-commands-dir=.' },
    -- filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    -- root_markers = { 'compile_commands.json', '.git' },
    -- 如果项目里同时有 .clangd 文件，clangd 会自动读取，无需写在 settings 里
}
vim.lsp.enable('clangd')
