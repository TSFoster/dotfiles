set background=dark

let g:solarized_termtrans = 1
colorscheme base16-default
let Powerline_colorscheme = 'solarized16'

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

execute "call Set". join(readfile($HOME."/.lightdark")) . "()"

command! ReverseBackground call ReverseBackground()
command! SetLight call SetLight()
command! SetDark call SetDark()
noremap <F11> <Esc>:ReverseBackground<CR>
noremap <F3> <Esc>:SetLight<CR>
noremap <F4> <Esc>:SetDark<CR>
nnoremap <F11> :ReverseBackground<CR>
nnoremap <F3> :SetLight<CR>
nnoremap <F4> :SetDark<CR>
