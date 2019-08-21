Plugin 'ternjs/tern_for_vim'
Plugin 'carlitux/deoplete-ternjs'

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

let g:ale_fixers.javascript = ['prettier', 'eslint']

augroup javascript
  autocmd!
  autocmd BufNewFile,BufRead *.es6 setfiletype javascript
augroup END


Plugin 'mogelbrod/vim-jsonpath'

au FileType json nnoremap <buffer> <silent> <expr> <leader>jp jsonpath#echo()
au FileType json nnoremap <buffer> <silent> <expr> <leader>jg jsonpath#goto()


" vim: tabstop=2 softtabstop=2 shiftwidth=2
