-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
-- Edit 20/04/2025 added clangd but had to manually install it through mason.
-- For some reason adding it here didn't do nothing. maybe slow internet probs?
-- require("mason").setup()
-- require("mason-lspconfig").setup {
--   ensure_installed = { "html", "cssls", "clangd" },
-- }
local servers = { "html", "cssls", "clangd", "pyright" }
lspconfig._myservers = servers
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })

  vim.lsp.enable(lsp)
end

