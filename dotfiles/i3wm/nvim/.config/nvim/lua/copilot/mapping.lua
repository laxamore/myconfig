-- use C-j to navigate to next item
vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(copilot-next)', {})
-- use C-k to accept suggestion
vim.api.nvim_set_keymap('i', '<C-k>', 'copilot#Accept("<CR>")', {silent = true, expr = true})
