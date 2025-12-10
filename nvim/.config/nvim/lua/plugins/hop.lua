return {
    "smoka7/hop.nvim",
    opts = {},
    config = function()
         require("hop").setup({
             hint_position = require("hop.hint").HintPosition.END
         })
   end,
   keys = {
        {"<leader>hw",":HopWord<CR>",silent=true},
        {"<leader>hcl",":HopAnywhereCurrentLine<CR>",silent=true},
        {"<leader>hl",":HopLine<CR>",silent=true},
        {"<leader><leader>l",":HopLine<CR>",silent=true},
        {"<leader><leader>w",":HopWord<CR>",silent=true},
        {"<leader><leader><leader>",":HopWord<CR>",silent=true},
   }
}
