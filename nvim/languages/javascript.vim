Plugin 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript'] }
Plugin 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plugin 'carlitux/deoplete-ternjs', {
" \   'for': ['javascript', 'javascript.jsx'],
" \   'do': 'npm i -g tern'
" \ }
Plugin 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plugin 'roxma/nvim-cm-tern',  { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install'}

Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }
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
