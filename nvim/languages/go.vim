Plugin 'zchee/deoplete-go', { 'do': 'make'}
let g:deoplete#sources#go#gocode_binary = substitute(system('which gocode'),'\n','','g')

" vim: tabstop=2 softtabstop=2 shiftwidth=2
