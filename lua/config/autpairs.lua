local M = {}

function M.setup()
  require("nvim-autopairs").setup({})

  -- 如果用了 nvim-cmp，确保补全确认时插入括号
  local cmp_ok, cmp = pcall(require, "cmp")
  if cmp_ok then
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end
end

return M

