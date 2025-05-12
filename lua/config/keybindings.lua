-- 快速移动
vim.keymap.set({'n', 'v'}, 'H', '4h', {noremap = true, silent = true})
vim.keymap.set({'n', 'v'}, 'J', '4j', {noremap = true, silent = true})
vim.keymap.set({'n', 'v'}, 'K', '4k', {noremap = true, silent = true})
vim.keymap.set({'n', 'v'}, 'L', '4l', {noremap = true, silent = true})
-- 保存操作
vim.keymap.set('n', '<leader>w', ':w<CR>', {noremap = true, silent = true})
