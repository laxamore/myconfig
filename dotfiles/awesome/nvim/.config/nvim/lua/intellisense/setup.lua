Servers = {
  'pyright',        -- Python
  'rust_analyzer',  -- Rust
  'tsserver',       -- Javascript
  'gopls',          -- Go
  'vimls',          -- Vim
  'lua_ls',         -- Lua
  'bashls',         -- Bash
  'clangd',         -- C/C++
  'cssls',          -- CSS
}

require('intellisense.cmp.setup')
require('intellisense.mason.setup')
require('intellisense.lspconfig.setup')
