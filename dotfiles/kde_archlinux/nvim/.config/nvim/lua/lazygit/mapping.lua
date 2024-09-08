local function map(m, k, v, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(m, k, v, options)
end

map('n', '<leader>gg', ':LazyGit<CR>')