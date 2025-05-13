-- Mason + mason-lspconfig
local cmp = require'cmp'

cmp.setup({
  completion = {
    autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
  },

  mapping = cmp.mapping.preset.insert({
    ['<A-S-j>'] = cmp.mapping.select_next_item(),
    ['<A-S-k>'] = cmp.mapping.select_prev_item(),

    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Tab 确认补全
    ['<CR>'] = cmp.config.disable,                      -- 禁用 Enter
  }),

  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }
})

require("mason").setup()
require("mason-lspconfig").setup {
  automatic_installation = true,
  handlers = {
    -- 默认 handler
    function(server_name)
      require("lspconfig")[server_name].setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      }
    end,
  },
}

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },         -- 把 vim 当全局
      },
      runtime = {
        version = "LuaJIT",
        path    = vim.split(package.path, ";"),
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false },
    },
  },
}

