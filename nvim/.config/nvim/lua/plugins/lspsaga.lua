return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
    ,
    keys = {
        { "gca", "<Cmd>Lspsaga code_action<CR>", silent = true },
        { "gd", "<Cmd>Lspsaga goto_definition<CR>", silent = true },
        { "gr", "<Cmd>Lspsaga finder<CR>", silent = true },
        {"g]e", "<Cmd>Lspsaga diagnostic_jump_prev<CR>",silent = true},
        {"g[e", "<Cmd>Lspsaga diagnostic_jump_next<CR>",silent = true},
        { "<A-t>", "<Cmd>Lspsaga term_toggle<CR>", silent = true },
    }
}
