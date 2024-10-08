require('nvim-tree.plugin')
require('nvim-tree.mapping')

local function setup()
  -- disable netrw at the very start of your init.lua (strongly advised)
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- set termguicolors to enable highlight groups
  vim.opt.termguicolors = true

  -- empty setup using defaults
  require("nvim-tree").setup()

  -- OR setup with some options
  require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
      adaptive_size = true,
      mappings = {
        list = {
          --{ key = "u", action = "dir_up" },
        },
      },
      hide_root_folder = true,
    },
    renderer = {
      group_empty = false,
    },
    filters = {
      dotfiles = false,
    },
  })
end
pcall(setup)
