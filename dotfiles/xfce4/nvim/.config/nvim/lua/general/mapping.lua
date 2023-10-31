local function map(m, k, v, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(m, k, v, options)
end

-- Set leader key to space
vim.g.mapleader = ' '

-- Remap Ctrl + c Behave like Esc
map('n', '<C-c>', '<esc>')
map('i', '<C-c>', '<esc>')
map('v', '<C-c>', '<esc>')
map('', '<C-c>', '<esc>')

map('i', '<C-t>', '<esc><esc><esc>:tabnew<CR>')
map('', '<C-t>', ':tabnew<CR>')
