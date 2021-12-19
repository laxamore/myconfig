set tabstop=2 
set shiftwidth=2
set expandtab
set number
set mouse=a


source ~/.config/nvim/basic.vim
source ~/.config/nvim/filetypes.vim
source ~/.config/nvim/extended.vim

hi Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=NONE

set relativenumber

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set clipboard=unnamedplus

" Open fzf Files search
map <C-p> :Files<CR>
" Yank shortcut
map <C-y> y
" Paste shortcut
map <C-v> p
" Cut shortcut
map <C-x> d
" new tab shortcut
map <C-n> :tabnew<CR>
" next tab shortcut
map <C-w> gt
" prev tab shortuct
map <C-q> gT
