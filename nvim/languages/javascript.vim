Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'ternjs/tern_for_vim'
" Plugin 'carlitux/deoplete-ternjs', {
" \   'do': 'npm i -g tern'
" \ }
Plugin 'othree/jspc.vim'
Plugin 'roxma/nvim-cm-tern', { 'do': 'yarn install' }

Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
let g:prettier#autoformat = 0


let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

augroup javascript
  autocmd!
  autocmd BufNewFile,BufRead *.es6        setfiletype javascript
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierMaybe
  autocmd FileType javascript set formatprg=prettier\ --stdin
augroup END

" vim: tabstop=2 softtabstop=2 shiftwidth=2
