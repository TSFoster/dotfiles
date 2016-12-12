Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-unimpaired'

" Space is a great <Leader>.
" It is a large button that can be hit by either hand without moving.
let mapleader="\<Space>"

" jj is a rare combination that stays on the home row and is faster than
" hitting <C-[> or <ESC>. Only common clash is when the last character you
" insert is a j, in which case you can type "jkj".
inoremap jj <ESC>
inoremap jkj j<ESC>

" Semi-colon is much faster to type than colon
nnoremap ; :
vnoremap ; :
nnoremap <Leader>; ;
vnoremap <Leader>; ;
nnoremap q; q:

" Swap visual and visual block modes. Visual block more commonly used by me
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

" %% in command line maps to current file's directory
cnoremap <expr> %% fnameescape(expand('%:h').'/')
" %p in command line maps to current file's path
cnoremap <expr> %p fnameescape(expand('%:p'))
" %p in command line maps to current file's relative path
cnoremap <expr> %r fnameescape(expand('%'))

" Quick ways to write and quit buffers
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap <Leader><Leader>w :wq<CR>
nnoremap <Leader><Leader>q :wq<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wa<CR>



" Common substitution patterns, accessible with one button press (on a Mac
" keyboard, at least)
nmap § :%s//g<LEFT><LEFT>
vmap § :s//g<LEFT><LEFT>


nnoremap <silent> <Leader>hl :set hls!<CR>


function! HelpToggle()
  let helpIsOpen = 0
  let currentWindow = 0
  while (winbufnr(currentWindow) > -1)
    if (getbufvar(winbufnr(currentWindow), '&buftype') ==# 'help')
      let helpIsOpen = 1
      break
    endif
    let currentWindow += 1
  endwhile
  if helpIsOpen
    helpclose
  elseif &ft == 'vim'
    execute 'help ' . expand('<cword>')
  else
    Helptags
  endi
endfunction

nnoremap <silent> <Leader>? :call HelpToggle()<CR>
