augroup javascript
  autocmd!
  autocmd BufNewFile,BufRead *.es6 setfiletype javascript
augroup END


Plugin 'mogelbrod/vim-jsonpath'

augroup json
  autocmd!
  autocmd FileType json nnoremap <buffer> <silent> <expr> <leader>jp jsonpath#echo()
  autocmd FileType json nnoremap <buffer> <silent> <expr> <leader>jg jsonpath#goto()
  autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END


" vim: tabstop=2 softtabstop=2 shiftwidth=2
