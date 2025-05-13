-- init.lua 或 lua/config/lsp.lua
--[[
require("lspconfig").clangd.setup({
  on_attach = function(client, bufnr)
    -- 只对支持 formatting 的 LSP 客户端 绑定
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f",
        "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
        { silent = true, noremap = true, desc = "LSP 格式化" })
    end
  end,
  -- 根据需要添加其它 clangd 配置
})
]]

-- 在你的 init.lua 或 lua/config/lsp.lua 中

-- 1. 通用 LspAttach 自动命令，用于在任意 LSP 客户端附加到 buffer 时执行
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local bufnr = ev.buf

    -- 2. 仅针对 C/C++ 文件类型，并且客户端支持格式化
    if vim.tbl_contains({ 'c', 'cpp', 'objc', 'objcpp' }, vim.bo[bufnr].filetype)
      and client.server_capabilities.documentFormattingProvider then

      -- 3. 注册 BufWritePre 自动命令，在保存前格式化当前 buffer
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false, bufnr = bufnr })
        end,
        desc = '保存时自动格式化 C/C++ 代码',
      })  -- async=false 可确保格式化在写盘前完成 :contentReference[oaicite:2]{index=2} :contentReference[oaicite:3]{index=3}

    end
  end,
  desc = '为支持格式化的 LSP 客户端设置自动格式化',
})

