-- 主题
vim.cmd.colorscheme('kanagawa')
vim.o.termguicolors = true
-- UTF-8 编码
vim.o.fileencoding = 'utf-8'
-- 移动时保留行
vim.o.scrolloff = 5
-- 行号
vim.o.signcolumn = 'yes'
vim.o.number = true
vim.o.relativenumber = true
-- 缩进
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
-- LSP
vim.o.pumheight = 7
vim.diagnostic.config({
  -- 报错以虚拟文本形式显示在行尾
  virtual_text = {
    prefix  = '●',     -- 图标前缀，可改成 '◉'、'■' 等
    spacing = 4,       -- 文本和代码之间的距离
  },
  -- 同时保留 signcolumn（E/W 图标列）和 underline
  signs            = true,
  underline        = true,
  update_in_insert = false,  -- 插入模式下不刷新
  severity_sort    = true,   -- 严重级别排序
})
