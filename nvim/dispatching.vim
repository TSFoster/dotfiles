Plugin 'hkupty/iron.nvim', {'do': ':UpdateRemotePlugins'}
nnoremap <silent> <Leader>re :IronRepl<CR>

Plugin 'neomake/neomake', 'neomake#configure#automake("w")'

let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint']


Plugin 'tpope/vim-dadbod'

" vim: tabstop=2 softtabstop=2 shiftwidth=2
