Plugin 'ternjs/tern_for_vim'
Plugin 'carlitux/deoplete-ternjs'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }

let g:prettier#autoformat = 0
let s:shouldautoformat = 1
function! PrettierMaybe()
  if s:shouldautoformat
    Prettier
  endif
endfunction
function! PrettierOn()
  let s:shouldautoformat = 1
endfunction
function! PrettierOff()
  let s:shouldautoformat = 0
endfunction
command! PrettierMaybe call PrettierMaybe()
command! PrettierOn call PrettierOn()
command! PrettierOff call PrettierOff()


let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

augroup javascript
  autocmd!
  autocmd BufNewFile,BufRead *.es6 setfiletype javascript
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierMaybe
  autocmd FileType javascript set formatprg=prettier\ --stdin
augroup END


Plugin 'mogelbrod/vim-jsonpath'

au FileType json nnoremap <buffer> <silent> <expr> <leader>jp jsonpath#echo()
au FileType json nnoremap <buffer> <silent> <expr> <leader>jg jsonpath#goto()


" vim: tabstop=2 softtabstop=2 shiftwidth=2
