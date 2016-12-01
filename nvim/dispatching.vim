Plugin 'hkupty/iron.nvim', {'do': ':UpdateRemotePlugins'}
nnoremap <Leader>re :IronRepl<CR>

Plugin 'vim-pandoc/vim-pandoc'

Plugin 'vim-utils/vim-man'

Plugin 'neomake/neomake'

autocmd! BufWritePost * Neomake

let g:neomake_open_list = 2

let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_elm_elm_lint_maker = { 'exe': 'elm-lint', 'errorformat': '%f:%l:%c [%t] %m' }
let g:neomake_elm_enabled_makers = ['elm_lint']
