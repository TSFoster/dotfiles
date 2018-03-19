Plugin 'artnez/vim-wipeout'
Plugin 'tpope/vim-eunuch'

set spelllang=en_gb

Plugin 'Valloric/ListToggle'

let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>L'

Plugin 'tpope/vim-vinegar'

let g:netrw_home=$HOME        " Store network files in fixed location, not current directory
let g:netrw_preview      = 1  " Vertical preview

Plugin 'lambdalisue/suda.vim'
cmap w!! w suda://%

" vim: tabstop=2 softtabstop=2 shiftwidth=2
