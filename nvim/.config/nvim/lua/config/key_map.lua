vim.keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", { silent = true })

-- 普通模式：Ctrl+?（实际为 <C-_>） 触发 gcc
vim.keymap.set('n', '<C-_>', 'gcc', { remap = true, silent = true })
vim.keymap.set('n', '<tab>', 'w', { remap = true, silent = true })
vim.keymap.set('i', '<C-_>', '<Esc>gccgi', { remap = true, silent = true })
-- 可视模式：也保持 gc
vim.keymap.set('x', '<C-_>', 'gc', { remap = true, silent = true })

vim.keymap.set({ "n", "i" }, "<A-F>", function()
    vim.lsp.buf.format()
end)

vim.keymap.set('n', '<leader>uw', function()
    vim.opt.wrap = not vim.opt.wrap:get()
    vim.notify('wrap ' .. (vim.opt.wrap:get() and 'ON' or 'OFF'))
end, { desc = 'Toggle wrap' })

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-Left>', '<C-w>h', opts)
vim.keymap.set('n', '<C-Down>', '<C-w>j', opts)
vim.keymap.set('n', '<C-Up>', '<C-w>k', opts)
vim.keymap.set('n', '<C-Right>', '<C-w>l', opts)

local resize = function(delta, direction)
    local times = vim.v.count1 -- 支持 5<alt>j 一次缩 5 行
    local cmd
    if direction == 'height' then
        cmd = delta > 0 and string.format('resize +%d', delta * times)
            or string.format('resize %d', delta * times)
    else
        cmd = delta > 0 and string.format('vertical resize +%d', delta * times)
            or string.format('vertical resize %d', delta * times)
    end
    vim.cmd(cmd)
end

vim.keymap.set('n', '<A-j>', function() resize(-1, 'height') end, { silent = true })
vim.keymap.set('n', '<A-k>', function() resize(1, 'height') end, { silent = true })
vim.keymap.set('n', '<A-h>', function() resize(-1, 'width') end, { silent = true })
vim.keymap.set('n', '<A-l>', function() resize(1, 'width') end, { silent = true })
vim.keymap.set('n', '<A-=>', '<C-w>=', { silent = true })
vim.keymap.set({'n','i'}, '<C-s>', '<Cmd>w<CR>', { silent = true })
vim.keymap.set({"n","i"}, '<A-c>', '<Cmd>bd<CR>=', { silent = true })


vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { silent = true })

