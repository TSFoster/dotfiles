Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-unimpaired'
Plugin 'jeetsukumaran/vim-indentwise'

" Space is a great <Leader>.
" It is a large button that can be hit by either hand without moving.
let mapleader="\<Space>"

" jj is a rare combination that stays on the home row and is faster than
" hitting <C-[> or <ESC>. Only common clash is when the last character you
" insert is a j, in which case you can type "jkj".
inoremap jj <ESC>
inoremap jkj j<ESC>

" Use backspace to flip between two files
nnoremap <BS> <C-^>

" Semi-colon is much faster to type than colon
nnoremap ; :
vnoremap ; :
nnoremap <Leader>; <Plug>Sneak_;
vnoremap <Leader>; <Plug>Sneak_;
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

function! Quit()
  if (winnr('$') == 1 && tabpagenr('$') == 1)
    if confirm('Are you sure you want to quit?', "&Yes\n&No", 2, "Question") == 1
      quit
    endif
  else
    quit
  endif
endfunction

nnoremap <silent> <Leader>q :call Quit()<CR>
nnoremap <silent> <Leader><Leader>q :xa<CR>

nnoremap <silent> <Leader>w :update<CR>
nnoremap <silent> <Leader>W :wa<CR>

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

" When using CTRL-C key to leave insert mode, it does not trigger the autocmd InsertLeave
inoremap <c-c> <ESC>

" vim: tabstop=2 softtabstop=2 shiftwidth=2
