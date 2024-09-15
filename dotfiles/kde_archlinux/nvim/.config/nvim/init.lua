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
  -- LSP
  {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
  {'neovim/nvim-lspconfig'},
  "williamboman/mason-lspconfig.nvim",
  "williamboman/mason.nvim",
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  'saadparwaiz1/cmp_luasnip',

  -- Commentary
  'numToStr/Comment.nvim',

  -- Nerdtree
  'nvim-tree/nvim-web-devicons', -- optional, for file icons
  'nvim-tree/nvim-tree.lua',

  -- Colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Fuzzy Finder
  {'nvim-telescope/telescope.nvim', branch = '0.1.x'},
  'nvim-lua/plenary.nvim',

  -- TreeSitter
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

  -- Appearance
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  },
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- Markdown Preview
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
    app = 'brave',
  },

  -- Copilot
  'github/copilot.vim',
})
-- End External Plugins Install }}

-- {{ External Plugins Setup
vim.cmd("colorscheme catppuccin")

-- Fuzzy Finder
require('telescope.setup')

-- Treesitter
require('treesitter.setup')

-- Nerdtree
require('nvim-tree.setup')

-- LazyGit
require('lazygit.setup')

-- Copilot
require('copilot.setup')

-- -- Language Server
require('intellisense.setup')

-- Appearance
require('bufferline.setup')
require('lualine.setup')
-- End External Plugins Setup }}

