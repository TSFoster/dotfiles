Plugin 'artnez/vim-wipeout'
Plugin 'tpope/vim-eunuch'
Plugin 'dbmrq/vim-dialect'

set spelllang=en_gb

Plugin 'fcpg/vim-kickfix'
let g:kickfix_zebra=0


Plugin 'romainl/vim-qf'
let g:qf_mapping_ack_style = 1
nmap <Leader>l <Plug>qf_loc_toggle
nmap <Leader>L <Plug>qf_qf_toggle

Plugin 'tpope/vim-vinegar'

let g:netrw_home=$HOME " Store network files in fixed location, not current directory
let g:netrw_preview = 1 " Vertical preview

Plugin 'lambdalisue/suda.vim'
cmap w!! w suda://%

Plugin 'jbgutierrez/vim-partial'
let g:partial_templates={}

" vim: tabstop=2 softtabstop=2 shiftwidth=2
