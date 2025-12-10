return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        'nvim-telescope/telescope-fzf-native.nvim',
    },
    cmd = "Telescope",
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    },
    config = function(_, opts)
        local telescope = require "telescope"
        telescope.setup(opts)
        telescope.load_extension("fzf")
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
    keys = {
        { "<leader>sf",        "<Cmd>Telescope find_files<CR>", desc = "search files", silent = true },
        { "<leader><leader>f", "<Cmd>Telescope find_files<CR>", desc = "search files", silent = true },
        { "<leader><leader>b", "<Cmd>Telescope buffers<CR>", desc = "search files", silent = true },
        { "<leader><leader>s", "<Cmd>Telescope live_grep<CR>", desc = "search files", silent = true },
    }
}
