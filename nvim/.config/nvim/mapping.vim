" Make Ctrl-c behave like esc
nnoremap <C-c> <esc>
" Make p behave to put
nnoremap p "0p
" open telescope find_files
nnoremap <C-p> :lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.8}})<CR>
" open teelscope git_files
nnoremap <esc>p :lua require('telescope.builtin').git_files({layout_strategy='vertical',layout_config={width=0.8}})<CR>
" open telescope live_grep
nnoremap <C-g> :lua require('telescope.builtin').live_grep({layout_strategy='vertical',layout_config={width=0.8}})<CR>
" new tab shortcut
 map <C-t> :tabnew<CR>
" nerdtree keymap
nnoremap <C-n> :NERDTreeTabsToggle<CR>
" multiplecursor key remap
let g:VM_maps={}
let g:VM_maps['Find Under']         = '<C-d>'            
let g:VM_maps['Find Subword Under'] = '<C-d>'           

