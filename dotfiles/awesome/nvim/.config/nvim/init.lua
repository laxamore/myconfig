-- {{ Lazy Plugin Manager Init
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- End Lazy Plugin Manager Init }}

-- {{ General Settings
require('general.setup')
require('general.mapping')
-- End General Settings }}

-- {{ External Plugins 
require('lazy').setup({
  -- Colorscheme Require, Choose one
  'yong1le/darkplus.nvim',
  -- 'flazz/vim-colorschemes',

  -- Fuzzy Finder
  {'nvim-telescope/telescope.nvim', branch = '0.1.x'},
  'nvim-lua/plenary.nvim',

  -- TreeSitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  },

-- Nerdtree
  'nvim-tree/nvim-web-devicons', -- optional, for file icons
  'nvim-tree/nvim-tree.lua',

  -- Commentary
  'numToStr/Comment.nvim',

  -- Vim Visual Multi
  {
    'mg979/vim-visual-multi',
    branch = 'master'
  },

  -- Markdown Preview
  {
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]() 
      end,
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install", 
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" } 
    end,
    ft = {
      "markdown" 
    }, 
  },

  -- Language Serve & Completion & Snippets
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'saadparwaiz1/cmp_luasnip',
  {"L3MON4D3/LuaSnip", tag = "v1.1.0"},
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
})
-- End External Plugins Install }}

-- {{ External Plugins Setup
-- Colorscheme Require, Choose one
vim.cmd("colorscheme darkplus")
-- vim.cmd("colorscheme monokai")

-- Fuzzy Finder
require('telescope.setup')

-- TreeSitter
require('treesitter.setup')

-- Nerdtree
require('nvim-tree.setup')

-- Commentary
require('Comment').setup()

-- Copilot
require('copilot.setup')

-- Vim Visual Multi
require("vim-visual-multi.mapping")

-- Language Serve & Completion & Snippets
require('intellisense.setup')
-- End External Plugins Setup }}

