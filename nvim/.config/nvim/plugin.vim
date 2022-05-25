" Vim Plugin
call plug#begin('~/.vim/plugged')
" just colorscheme
Plug 'morhetz/gruvbox'    

" nerdtree
Plug 'preservim/nerdtree'  
Plug 'jistr/vim-nerdtree-tabs'  

" nerdcommenter
Plug 'preservim/nerdcommenter'

" Fuzzy Finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"multiple cursor support
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Code of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" prettier plugin
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
call plug#end()


