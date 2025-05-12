vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
  callback = function()
    -- 保存当前光标位置
    local pos = vim.api.nvim_win_get_cursor(0)

    -- 执行 clang-format
    vim.cmd("silent! %!clang-format")

    -- 还原光标位置
    pcall(vim.api.nvim_win_set_cursor, 0, pos)
  end,
})

