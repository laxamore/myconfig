Servers = {
  'pyright',        -- Python
  'rust_analyzer',  -- Rust
  'tsserver',       -- Javascript
  'vimls',          -- Vim
  'lua_ls',         -- Lua
  'bashls',         -- Bash
  'clangd',         -- C/C++
  'cssls',          -- CSS
}

require('intellisense.cmp.setup')
require('intellisense.mason.setup')
require('intellisense.lspconfig.setup')
