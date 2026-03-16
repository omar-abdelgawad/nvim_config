local lspconfig = package.loaded["lspconfig"]

-- List of servers to ignore during install
-- Edit 13/9/2025: ignore pyright because Mason had a problem installing it
-- 16/3/2026: I installed pyright using "uv tool install pyright[nodejs]" because
-- turns out that snap's node doesn't work with nvim for some reason and probably
-- it was the reason mason couldn't install pyright so yeah
local ignore_install = {"pyright"}

-- Helper function to find if value is in table
local function table_contains(table, value)
  for _, v in ipairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

-- Build a list of lsp servers to install minus the ignored
local all_servers = {}
for _, s in ipairs(lspconfig._myservers) do
  if not table_contains(ignore_install, s) then
    table.insert(all_servers, s)
  end
end

-- Note that we turned off automatic_installation because it was
-- completely unreliable and we did all the manual work ourselves in the end
require("mason-lspconfig").setup {
  ensure_installed = all_servers,
  automatic_installation = false, -- turn off automatic
}
