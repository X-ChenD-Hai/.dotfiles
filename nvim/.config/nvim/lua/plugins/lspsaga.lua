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
        { "gd", "<Cmd>Lspsaga goto_definition<CR>", silent = true },
        { "gr", "<Cmd>Lspsaga finder<CR>", silent = true },
        { "<A-t>", "<Cmd>Lspsaga term_toggle<CR>", silent = true },
    }
}
