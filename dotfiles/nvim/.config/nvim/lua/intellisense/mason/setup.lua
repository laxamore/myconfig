require('intellisense.mason.plugin')

-- local function setup()
require("mason-lspconfig").setup({
  ensure_installed = Servers,
  automatic_installaion = true,
})
-- end
-- pcall(setup)
