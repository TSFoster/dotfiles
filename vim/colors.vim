set background=dark

let g:solarized_termtrans = 1
colorscheme base16-default
let Powerline_colorscheme = 'solarized16'

function! SetLight()
  set background=light
  highlight Normal guibg=white guifg=black
endfunction

function! SetDark()
  set background=dark
  highlight Normal guibg=black guifg=white
endfunction

function! ReverseBackground()
  let Mysyn=&syntax
  if &background=="light"
    call SetDark()
  else
    call SetLight()
  endif
  syntax on
  execute "set syntax=" . Mysyn
endfunction
command! ReverseBackground call ReverseBackground()
command! SetLight call SetLight()
command! SetDark call SetDark()
noremap <F11> <Esc>:ReverseBackground<CR>
noremap <F3> <Esc>:SetLight<CR>
noremap <F4> <Esc>:SetDark<CR>
nnoremap <F11> :ReverseBackground<CR>
nnoremap <F3> :SetLight<CR>
nnoremap <F4> :SetDark<CR>

" Fixes Gitgutter colour issues
" See: https://github.com/airblade/vim-gitgutter/issues/164
autocmd ColorScheme * highlight clear SignColumn | call gitgutter#highlight#define_highlights()
