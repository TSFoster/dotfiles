Plugin 'artnez/vim-wipeout'
Plugin 'tpope/vim-eunuch'
Plugin 'dbmrq/vim-dialect'

set spelllang=en_gb

Plugin 'fcpg/vim-kickfix'
let g:kickfix_zebra=0


Plugin 'tpope/vim-vinegar'

let g:netrw_home=$HOME " Store network files in fixed location, not current directory
let g:netrw_preview = 1 " Vertical preview

Plugin 'lambdalisue/suda.vim'
cmap w!! w suda://%

Plugin 'jbgutierrez/vim-partial'
let g:partial_templates={}

" vim: tabstop=2 softtabstop=2 shiftwidth=2
