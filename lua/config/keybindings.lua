-- 快速移动
vim.keymap.set({'n', 'v'}, 'H', '4h', {noremap = true, silent = true})
vim.keymap.set({'n', 'v'}, 'J', '4j', {noremap = true, silent = true})
vim.keymap.set({'n', 'v'}, 'K', '4k', {noremap = true, silent = true})
vim.keymap.set({'n', 'v'}, 'L', '4l', {noremap = true, silent = true})
-- 保存操作
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', {noremap = true, silent = true})
-- 文件树
vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<CR>', {noremap = true, silent = true})
-- 关闭选项卡
vim.keymap.set('n', '<C-d>', '<cmd>Bdelete<CR>', {noremap = true, silent = true})
-- Ctrl + k：切换到下一个 buffer
vim.keymap.set('n', '<C-k>', ':BufferLineCycleNext<CR>', {
  noremap = true,
  silent = true,
  desc = 'BufferLine: 下一个 buffer',
})
-- Ctrl + j：切换到上一个 buffer
vim.keymap.set('n', '<C-j>', ':BufferLineCyclePrev<CR>', {
  noremap = true,
  silent = true,
  desc = 'BufferLine: 上一个 buffer',
})
-- Ctrl + t：新建 Tab
vim.keymap.set('n', '<C-t>', ':enew<CR>', {
  noremap = true,
  silent = true,
  desc = '新建 buffer（选项卡）',
})
-- LazyGit
vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<CR>', {noremap = true, silent = true})
-- 终端
vim.keymap.set('n', '<leader>t', '<cmd>terminal<CR>', {noremap = true, silent = true})
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', {noremap = true, silent = true})
