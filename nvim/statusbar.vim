Plugin 'vim-airline/vim-airline'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'

" Status is shown in airline, no need to show in command line
set noshowmode
