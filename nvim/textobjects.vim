Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-syntax'
Plugin 'lucapette/vim-textobj-underscore'
Plugin 'reedes/vim-textobj-quote'
Plugin 'glts/vim-textobj-comment'
Plugin 'wellle/targets.vim'

Plugin 'machakann/vim-swap'
let g:swap_no_default_key_mappings = 1
nmap g<Left> <Plug>(swap-prev)
nmap g<Right> <Plug>(swap-next)
nmap gs <Plug>(swap-interactive)

Plugin 'bkad/CamelCaseMotion'
map <silent> \w <Plug>CamelCaseMotion_w
map <silent> \b <Plug>CamelCaseMotion_b
map <silent> \e <Plug>CamelCaseMotion_e
map <silent> \ge <Plug>CamelCaseMotion_ge

" vim: tabstop=2 softtabstop=2 shiftwidth=2
