if exists("b:did_ftplugin") | finish | endif

if has('mac') && isdirectory("/Applications/Marked 2.app")
  nnoremap <buffer> <silent> <Leader>/m :MarkedToggle<CR>
endif

imap <buffer> <C-f> *
imap <buffer> <C-d> **
vmap <buffer> <C-i> S*
vmap <buffer> <C-b> S*gvS*
inoremap <buffer> ;` ```<CR><CR>```<Up><Up>

setlocal spell

" vim: tabstop=2 softtabstop=2 shiftwidth=2
