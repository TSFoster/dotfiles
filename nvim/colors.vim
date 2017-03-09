Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline-themes'

function! SetLight()
  set background=light

  let g:terminal_color_0 =  "#f7f9fb"
  let g:terminal_color_1 =  "#bf8b56"
  let g:terminal_color_2 =  "#56bf8b"
  let g:terminal_color_3 =  "#8bbf56"
  let g:terminal_color_4 =  "#8b56bf"
  let g:terminal_color_5 =  "#bf568b"
  let g:terminal_color_6 =  "#568bbf"
  let g:terminal_color_7 =  "#405c79"
  let g:terminal_color_8 =  "#aabcce"
  let g:terminal_color_9 =  "#bfbf56"
  let g:terminal_color_10 = "#e5ebf1"
  let g:terminal_color_11 = "#cbd6e2"
  let g:terminal_color_12 = "#627e99"
  let g:terminal_color_13 = "#223b54"
  let g:terminal_color_14 = "#bf5656"
  let g:terminal_color_15 = "#0b1c2c"
  let g:terminal_color_background = "#405c79"
  let g:terminal_color_foreground = "#56bf8b"

  if v:vim_did_enter == 1
    colorscheme base16-harmonic-light
    AirlineTheme base16_harmonic16
  else
    let g:colors_name = 'base16-harmonic-light'
    let g:airline_theme = 'base16_harmonic16'
  endif
endfunction

function! SetDark()
  set background=dark

  let g:terminal_color_0 =  "#0b1c2c"
  let g:terminal_color_1 =  "#bf8b56"
  let g:terminal_color_2 =  "#56bf8b"
  let g:terminal_color_3 =  "#8bbf56"
  let g:terminal_color_4 =  "#8b56bf"
  let g:terminal_color_5 =  "#bf568b"
  let g:terminal_color_6 =  "#568bbf"
  let g:terminal_color_7 =  "#cbd6e2"
  let g:terminal_color_8 =  "#627e99"
  let g:terminal_color_9 =  "#bfbf56"
  let g:terminal_color_10 = "#223b54"
  let g:terminal_color_11 = "#405c79"
  let g:terminal_color_12 = "#aabcce"
  let g:terminal_color_13 = "#e5ebf1"
  let g:terminal_color_14 = "#bf5656"
  let g:terminal_color_15 = "#f7f9fb"
  let g:terminal_color_background = "#0b1c2c"
  let g:terminal_color_foreground = "#cbd6e2"


  if v:vim_did_enter == 1
    colorscheme base16-harmonic16-dark
    AirlineTheme base16_harmonic16
  else
    let g:colors_name = 'base16-harmonic16-dark'
    let g:airline_theme = 'base16_harmonic16'
  end
endfunction

command! SetDark call SetDark()
command! SetLight call SetLight()

if join(readfile($HOME."/.lightdark")) == "Dark"
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
