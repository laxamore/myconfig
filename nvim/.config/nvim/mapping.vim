" Make Ctrl-c behave like esc
map <C-c> <esc>
" open telescope find_files
map <C-p> :lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.8}})<CR>
" open teelscope git_files
map <esc>p :lua require('telescope.builtin').git_files({layout_strategy='vertical',layout_config={width=0.8}})<CR>
" open telescope live_grep
map <C-g> :lua require('telescope.builtin').live_grep({layout_strategy='vertical',layout_config={width=0.8}})<CR>
" new tab shortcut
map <C-t> :tabnew<CR>
" nerdtree keymap
map <C-n> :NERDTreeTabsToggle<CR>
" multiplecursor key remap
let g:VM_maps={}
let g:VM_maps['Find Under']         = '<C-d>'            
let g:VM_maps['Find Subword Under'] = '<C-d>'           
" commentary keymap
vmap <c-_> <Plug>Commentary
nmap <c-_> <Plug>CommentaryLine
