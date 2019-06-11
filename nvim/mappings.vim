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
nmap <Leader>; <Plug>Sneak_;
vmap <Leader>; <Plug>Sneak_;
nnoremap q; q:

" Use gQ if wanting to go into ex mode. Q for repeating last macro
nnoremap Q @@

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


" Toggle list windows
" Adapted from https://github.com/tpope/vim-unimpaired/issues/97#issuecomment-371219365

function! QuickFix_toggle()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor
  copen
endfunction



function! s:BufferCount() abort
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction
function! Location_toggle()
  " https://github.com/Valloric/ListToggle/blob/master/plugin/listtoggle.vim
  let buffer_count_before = s:BufferCount()

  " Location list can't be closed if there's cursor in it, so we need
  " to call lclose twice to move cursor to the main pane
  silent! lclose
  silent! lclose

  if s:BufferCount() == buffer_count_before
    silent! lopen
    if s:BufferCount() == buffer_count_before
      echo 'No items in location list'
    endif
  endif
endfunction


" Do this after launching, to make sure it overrides unimpaired mappings
augroup toggle_lists
  autocmd!
  autocmd VimEnter * :nnoremap <silent> yoq :call QuickFix_toggle()<CR>
  autocmd VimEnter * :nnoremap <silent> yol :call Location_toggle()<CR>
augroup end


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

" Map C-z to M-z to allow detaching from abduco within abduco nvim
tnoremap <M-z> <C-z>


" vim: tabstop=2 softtabstop=2 shiftwidth=2
