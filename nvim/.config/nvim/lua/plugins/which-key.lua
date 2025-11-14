return {
  "folke/which-key.nvim",
  event = "VeryLazy",   -- 等 Neovim 空闲时再加载，启动无负担
  opts = {
    -- 可选：默认配置已足够，下面给出常用微调
    preset = "modern",        -- 图标更现代
    delay = function(ctx) return ctx.plugin and 0 or 300 end, -- 插件映射立即弹，其余 300ms
    icons = { breadcrumb = "»", separator = "➜" },
  },
  config = function(_, opts)
    require("which-key").setup(opts)

    -- 把你的自定义映射也注册进来，可带中文描述
    local wk = require("which-key")
    wk.add({
        { "<leader>b", group = "buffer" },
        { "<leader>h", group = "hop"},
      -- { "<leader>fr", "<cmd>Recent<cr>", desc = "最近打开" },
      -- { "<leader>g", group = "Git" },
      -- { "<leader>gs", "<cmd>Git status<cr>", desc = "状态" },
    })
  end,
}
