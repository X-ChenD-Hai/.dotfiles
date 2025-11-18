----------------------------------------------------------------------
-- 1. 基础 Leader（你已经在用，保留即可）
----------------------------------------------------------------------
vim.g.mapleader        = ' '
vim.g.maplocalleader   = '/'

----------------------------------------------------------------------
-- 2. 视觉增强
----------------------------------------------------------------------
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true
vim.opt.colorcolumn    = '80' -- 超长提醒
vim.opt.scrolloff      = 5    -- 上下始终留 5 行
vim.opt.sidescrolloff  = 5
vim.opt.wrap           = true -- 你后面开了 linebreak，这里必须 true
vim.opt.showbreak      = '~ ' -- 折行前缀
vim.opt.linebreak      = true
vim.opt.breakindent    = true
vim.opt.breakindentopt = 'shift:2'
vim.opt.termguicolors  = true -- 真彩，主题必备

----------------------------------------------------------------------
-- 3. 编辑习惯
----------------------------------------------------------------------
vim.opt.expandtab      = true
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 0  -- 0 表示跟随 tabstop，没问题
vim.opt.softtabstop    = -1 -- 也跟随 shiftwidth
vim.opt.smartindent    = true
vim.opt.autoindent     = true
vim.opt.autoread       = true
vim.opt.undofile       = true -- 持久撤销
vim.opt.undodir        = vim.fn.stdpath('data') .. '/undo'
vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.writebackup    = false
vim.opt.updatetime     = 200 -- 更快触发 CursorHold
vim.opt.timeoutlen     = 300 -- 键序列超时
vim.opt.clipboard:prepend({ 'unnamed', 'unnamedplus' })

----------------------------------------------------------------------
-- 4. 搜索
----------------------------------------------------------------------
vim.opt.ignorecase  = true
vim.opt.smartcase   = true
vim.opt.hlsearch    = false -- 你关了，可以保留
vim.opt.incsearch   = true  -- 实时高亮匹配

----------------------------------------------------------------------
-- 5. 窗口 / 分屏
----------------------------------------------------------------------
vim.opt.splitright  = true
vim.opt.splitbelow  = true
vim.opt.equalalways = false -- 不让 vim 自动拉平窗口

----------------------------------------------------------------------
-- 6. 命令栏与消息
----------------------------------------------------------------------
vim.opt.showmode    = false -- 你关了，配合 lualine 更干净
vim.opt.showcmd     = true
vim.opt.cmdheight   = 0     -- 0 行命令栏（Neovim 0.8+）
vim.opt.laststatus  = 3     -- 全局状态栏
vim.opt.shortmess:append({ I = true, c = true })


vim.opt.spell = true -- 英文拼写检查

----------------------------------------------------------------------
-- 7. 内置 LSP 诊断样式（你已有，微调）
----------------------------------------------------------------------
vim.diagnostic.config({
    virtual_text = true,
    -- virtual_lines = true,
    update_in_insert = true, -- 建议 false，减少输入时闪烁
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'if_many',
    },
})
-- 图标按需要加
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

----------------------------------------------------------------------
-- 8. WSL 专用剪贴板（你已有，保留）
----------------------------------------------------------------------
if vim.fn.has('wsl') == 1 then
    vim.api.nvim_create_autocmd('TextYankPost', {
        group = vim.api.nvim_create_augroup('WSLYank', { clear = true }),
        callback = function()
            vim.fn.system('clip.exe', vim.fn.getreg('"'))
        end,
    })
end

-- if vim.fn.has("win32") then
-- vim.o.shell = "pwsh.exe -Login"
-- end
local function first_exists(list)
    for _, name in ipairs(list) do
        local full = vim.fn.exepath(name)
        if full ~= "" then
            return full -- 返回绝对路径
        end
    end
    return nil
end

-- 2. 按你的优先级列表
local candidates = vim.fn.has("win32") == 1
    and { "pwsh", "powershell", "cmd" } -- Windows
    or { "zsh", "bash" }                -- Linux / macOS

local shell = first_exists(candidates)

-- 3. 找到就设；找不到就保持默认
if shell then
    vim.o.shell = (shell:match("%s") and '"%s"' or '%s'):format(shell)
    -- 可选：把 shell 标志也一起设好，Neovim 才能正确跑 ! 、:make 、term 等
    if shell:match("pwsh") or shell:match("powershell") then
        vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
        vim.o.shellquote   = ""
        vim.o.shellxquote  = ""
    elseif shell:match("bash") or shell:match("zsh") then
        vim.o.shellcmdflag = "-c"
        vim.o.shellquote   = ""
        vim.o.shellxquote  = ""
    end
end

-- 退出时保存视图（含折叠）
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
    pattern = { "*" },
    callback = function()
        vim.cmd("silent! mkview")
    end,
})
-- 进入时加载视图
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = { "*" },
    callback = function()
        vim.cmd("silent! loadview")
    end,
})
