local function map(m, k, v, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(m, k, v, options)
end

-- open telescope find_files
map('', '<C-p>', ":lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.8}})<CR>")
-- open teelscope git_files
map('', '<leader>p', ":lua require('telescope.builtin').git_files({layout_strategy='vertical',layout_config={width=0.8}})<CR>")
-- open telescope live_grep
map('', '<C-g>', ":lua require('telescope.builtin').live_grep({layout_strategy='vertical',layout_config={width=0.8}})<CR>")
