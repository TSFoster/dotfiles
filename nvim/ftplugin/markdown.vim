if exists("b:did_ftplugin") | finish | endif

if isdirectory("/Applications/Marked 2.app") && !exists('$SSH_CLIENT')
  packadd vim-marked
  nnoremap <buffer> <silent> <Leader>/m :MarkedToggle<CR>
endif

imap <buffer> <C-f> *
imap <buffer> <C-d> **
vmap <buffer> <C-i> S*
vmap <buffer> <C-b> S*gvS*
inoremap <buffer> ;` ```<CR><CR>```<Up><Up>

setlocal spell
