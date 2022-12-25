-- Replace tab with space 
vim.cmd(":set tabstop=2")
vim.cmd(":set shiftwidth=2")
vim.cmd(":set expandtab")

-- Display number
vim.cmd(":set number")

-- Mouse support
vim.cmd("set mouse=a")

-- Set bg to none for transparency support
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NonText ctermbg=NONE")

-- Line number with relative number
vim.cmd("set relativenumber")

-- Set clipboard with system clipboard
vim.cmd("set clipboard=unnamedplus")

-- Clear highlighting on escape in normal mode
vim.cmd("nnoremap <esc> :noh<return><esc>")
vim.cmd("nnoremap <esc>^[ <esc>^[")

-- Disable auto comment insertion
vim.cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

-- Set Scroll Off
vim.cmd("set so=10")
