return  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
        "rafamadriz/friendly-snippets"
    },
    event = "VeryLazy",
    opts = {
        completion = {
            documentation = {
                auto_show = true
            }
        },
        keymap = {
            preset = "super-tab",
        },
        sources = {
            default = { 'lsp', 'buffer', 'snippets', 'path' },
        },
        cmdline = {
           sources = function ()
                local cmp_type = vim.fn.getcmdtype()
                if cmp_type == "/" then
                    return  { "buffer" }
                elseif cmp_type == ":" then
                    return  { "cmdline" }
                end
                return {}
            end,
            keymap = {
                preset = "super-tab"
            },
            completion = {
                menu = {
                    auto_show = true,
                }
            }
        }
    }
}
