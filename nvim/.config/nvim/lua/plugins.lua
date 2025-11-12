return {
	{"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"}
,	  -- 1. 补全引擎
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",               -- 进入插入模式时才加载
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",            -- LSP 补全源
      "hrsh7th/cmp-buffer",              -- 缓冲区补全源
      "hrsh7th/cmp-path",                -- 文件路径补全源
      "hrsh7th/cmp-cmdline",             -- 命令行补全源
      "onsails/lspkind.nvim",            -- 图标美化
      -- 2. 代码片段引擎
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = "rafamadriz/friendly-snippets", -- 常用代码片段集合
      },
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer"  },
          { name = "path"    },
        }),
        formatting = {
          format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"]  = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            else fallback() end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then luasnip.jump(-1)
            else fallback() end
          end, { "i", "s" }),
        }),
      })

      -- 命令行补全
      cmp.setup.cmdline({ "/", "?" }, {
        sources = { { name = "buffer" } }
      })
      cmp.setup.cmdline(":", {
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } })
      })
    end,
  },
}
