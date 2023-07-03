local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('v', 'C-m', '<Plug>Commentary', opts)
vim.api.nvim_set_keymap('n', 'C-m', '<Plug>CommentaryLine', opts)

vim.cmd("vmap <c-m> <Plug>Commentary")
vim.cmd("nmap <c-m> <Plug>CommentaryLine")
