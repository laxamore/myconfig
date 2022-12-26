require('intellisense.mason.plugin')

local function setup()
  require("mason").setup({
      ui = {
          icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
          }
      }
  })

  require("mason-lspconfig").setup({
    ensure_installed = Servers,
    automatic_installaion = true,
  })
end
pcall(setup)
