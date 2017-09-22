Plugin '~/.config/nvim/strange_harmony'
let g:colors_name = 'base16-strange_harmony'
let g:airline_theme = 'base16_strange_harmony'

function! SetLight()
  set background=light
endfunction

function! SetDark()
  set background=dark
endfunction

command! SetDark call SetDark()
command! SetLight call SetLight()

if join(readfile($HOME."/.config/theme")) == "dark"
  SetDark
else
  SetLight
endif

function! ReverseBackground()
  if &background=="light"
    SetDark
  else
    SetLight
  endif
endfunction

command! ReverseBackground call ReverseBackground()

nnoremap <silent> <F11> :ReverseBackground<CR>
