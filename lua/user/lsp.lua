local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("mason").setup()
require ("mason-lspconfig").setup({
  ensure_installed = { "lua_ls" }

})

require("lspconfig").lua_ls.setup {
  capabilities = capabilities
}
require("lspconfig").clangd.setup{
  capabilities = capabilities
}

require'lspconfig'.jsonls.setup {
  capabilities = capabilities,
}

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
}

vim.diagnostic.config(config)
