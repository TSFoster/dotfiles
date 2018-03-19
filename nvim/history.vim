Plugin 'mbbill/undotree'
nnoremap <silent> <F5> :UndotreeToggle<CR>
let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 1
let g:undotree_SetFocusWhenToggle = 0

set undofile                             " Store undos in a file
set undolevels=1000                      " Maximum number of changes that can be undone
set undoreload=10000                     " Maximum number lines to save for undo on a buffer reload
set viminfo='1000,f1,<500                " Keep marks for 1000 files, store global marks, limit viminfo to 500 lines

" vim: tabstop=2 softtabstop=2 shiftwidth=2
