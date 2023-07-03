require('intellisense.mason.plugin')

require("mason").setup()
-- local function setup()
require("mason-lspconfig").setup({
  ensure_installed = Servers,
  automatic_installaion = true,
})
-- end
-- pcall(setup)
