require('config.preload')

require('config.lazy')

require('plugins.lualine')
require("nvim-tree").setup()
require("bufferline").setup({
  options = {
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",

    -- 1. offsets 确保 NvimTree 窗口已被 bufferline 自动“避让”
    offsets = {
      {
        filetype = "NvimTree",   -- 作用对象
        text = "File Explorer",               -- 左侧留空，无标题
        padding = 1,             -- 留白宽度，可按需调整
        separator = false,       -- 不显示分隔线
      },
    },

    -- 2. custom_filter 彻底“隐藏” NvimTree buffer
    custom_filter = function(bufnr)
      -- 获取该 buffer 的 filetype
      local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
      -- 只要 filetype 是 NvimTree，就返回 false（不显示）；其它一律显示
      if ft == "NvimTree" then
        return false
      end
      return true
    end,
  },
})


require('config.autpairs').setup()
require("config.lsp")

require('config.format')
require('config.basic')
require('config.keybindings')
require('config.clipboard')
