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
local servers = { "html", "cssls", "clangd", "basedpyright" }
lspconfig._myservers = servers
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
