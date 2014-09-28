set background=dark

let g:solarized_termtrans = 1
colorscheme solarized
let Powerline_colorscheme = 'solarized16'

function! ReverseBackground()
  let Mysyn=&syntax
  if &background=="light"
    set background=dark
    highlight Normal guibg=black guifg=white
  else
    set background=light
    highlight Normal guibg=white guifg=black
  endif
  syntax on
  execute "set syntax=" . Mysyn
endfunction
command! ReverseBackground call ReverseBackground()
noremap <F11> :ReverseBackground<CR>
