Plugin 'sjl/gundo.vim'

let g:gundo_right = 1
let g:gundo_prefer_python3 = has('python3')
nnoremap <F5> :GundoToggle<CR>

set undofile                             " Store undos in a file
set undolevels=1000                      " Maximum number of changes that can be undone
set undoreload=10000                     " Maximum number lines to save for undo on a buffer reload
set viminfo='1000,f1,<500                " Keep marks for 1000 files, store global marks, limit viminfo to 500 lines
