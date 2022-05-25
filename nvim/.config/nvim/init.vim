source $HOME/.config/nvim/plugin.vim
source $HOME/.config/nvim/telescope.vim
source $HOME/.config/nvim/lspconfig.vim
source $HOME/.config/nvim/formatter.vim
source $HOME/.config/nvim/treesitter.vim

" Replace tab with space 
set tabstop=2 
set shiftwidth=2
set expandtab

" Display number
set number

" Mouse support
set mouse=a

" Set bg to none for transparency support
hi Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=NONE

" Line number with relative number
set relativenumber

" Set clipboard with system clipboard
set clipboard=unnamedplus

" Applying colorscheme
colorscheme Monokai
" colorscheme darkplus

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Disable auto comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

source $HOME/.config/nvim/mapping.vim
