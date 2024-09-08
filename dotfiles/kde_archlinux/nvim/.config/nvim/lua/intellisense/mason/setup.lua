require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = Servers,
  automatic_installaion = true,
})
