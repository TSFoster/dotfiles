if exists("b:did_ftplugin") | finish | endif

nnoremap <buffer> <silent> <expr> <Leader>jp jsonpath#echo()
nnoremap <buffer> <silent> <expr> <Leader>jg jsonpath#goto()

syntax match Comment +\/\/.\+$+

" vim: tabstop=2 softtabstop=2 shiftwidth=2
