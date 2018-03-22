Plugin 'artnez/vim-wipeout'
Plugin 'justinmk/vim-dirvish'
Plugin 'tpope/vim-eunuch'

set spelllang=en_gb

Plugin 'romainl/vim-qf'

let g:qf_mapping_ack_style = 1
nmap <Leader>l <Plug>qf_loc_toggle
nmap <Leader>L <Plug>qf_qf_toggle

Plugin 'tpope/vim-vinegar'

let g:netrw_home=$HOME " Store network files in fixed location, not current directory
let g:netrw_preview = 1 " Vertical preview

Plugin 'lambdalisue/suda.vim'
cmap w!! w suda://%

" vim: tabstop=2 softtabstop=2 shiftwidth=2
