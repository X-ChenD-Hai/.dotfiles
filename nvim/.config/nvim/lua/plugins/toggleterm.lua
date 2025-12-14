return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
        keys = {
            { mode = {"n",'i','v','t'}, "<A-t>", "<Cmd>ToggleTerm<Cr>", silent = true }
        }
    },
}
