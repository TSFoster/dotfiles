Plugin 'pbogut/deoplete-padawan', { 'for': ['php'] }

let g:deoplete#sources#padawan#add_parentheses = 1
let g:deoplete#sources.php = ['padawan'] + g:default_sources

" vim: tabstop=2 softtabstop=2 shiftwidth=2
