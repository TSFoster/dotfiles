Plugin 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript'] }
Plugin 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plugin 'carlitux/deoplete-ternjs', {
" \   'for': ['javascript', 'javascript.jsx'],
" \   'do': 'npm i -g tern'
" \ }
Plugin 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

Plugin 'prettier/vim-prettier', { 'for': ['javascript', 'javascript.jsx'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql Prettier

let g:deoplete#sources['javascript.jsx'] =  ['ternjs'] + g:default_sources
let g:deoplete#omni#functions.javascript = ['tern#Complete', 'jspc#omni']

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

autocmd BufNewFile,BufRead *.es6        setfiletype javascript

autocmd FileType javascript set formatprg=prettier\ --stdin
