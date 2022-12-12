require('lspconfig.plugin')
require('lspconfig.mapping')

local function setup()
  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'gopls', 'vimls', 'sumneko_lua', 'bashls', 'ccls' }
  for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
      on_attach = on_attach,
      flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
      },
      capabilities = capabilities
    }
  end
end

pcall(setup)
