" Vim Plugin
call plug#begin('~/.vim/plugged')

" Just Awesome Colorscheme
Plug 'flazz/vim-colorschemes'
Plug 'yong1le/darkplus.nvim'

" nerdtree
Plug 'preservim/nerdtree'  
Plug 'jistr/vim-nerdtree-tabs'  

" nerdcommenter
Plug 'tpope/vim-commentary'

" Fuzzy Finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" multiple cursor support
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Formatter
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" lsp and completion
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
""""""""""""""" 

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()


