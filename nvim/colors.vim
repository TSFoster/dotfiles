Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline-themes'

function! SetLight()
  if &background=="dark"
    call ReverseBackground()
  endif
endfunction

function! SetDark()
  if &background=="light"
    call ReverseBackground()
  endif
endfunction

function! ReverseBackground()
  if &background=="light"
    set background=dark
    colorscheme base16-harmonic16-dark
    AirlineTheme base16_harmonic16
  else
    set background=light
    colorscheme base16-harmonic16-light
    AirlineTheme base16_harmonic16
  endif
endfunction

let g:airline_theme = 'base16_harmonic16'
if join(readfile($HOME."/.lightdark")) == "Dark"
  set background=dark
  let g:colors_name = 'base16-harmonic16-dark'
else
  set background=light
  let g:colors_name = 'base16-harmonic16-light'
endif

command! ReverseBackground call ReverseBackground()
command! SetLight call SetLight()
command! SetDark call SetDark()

nnoremap <silent> <F11> :ReverseBackground<CR>
