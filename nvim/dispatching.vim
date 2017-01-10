Plugin 'hkupty/iron.nvim', {'do': ':UpdateRemotePlugins'}
nnoremap <silent> <Leader>re :IronRepl<CR>

Plugin 'vim-utils/vim-man'

Plugin 'w0rp/ale'

let g:ale_sign_column_always = 1
let g:ale_sign_error = '×'
let g:ale_sign_warning = '⚠️'

hi! link ALEError GitGutterDeleteLine
hi! link ALEWarning GitGutterChangeLine
hi! link ALEErrorSign GitGutterDelete
hi! link ALEWarningSign GitGutterChange


Plugin 'neomake/neomake'

autocmd! BufWritePost * Neomake

let g:neomake_open_list = 2

let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_elm_elm_lint_maker = { 'exe': 'elm-lint', 'errorformat': '%f:%l:%c [%t] %m' }
let g:neomake_elm_enabled_makers = ['elm_lint']
