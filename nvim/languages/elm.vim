let g:polyglot_disabled += ['elm']

Plugin 'ElmCast/elm-vim'

let g:ale_linters.elm = ['elm_ls']
let g:ale_elm_analyse_use_global = 1

let g:LanguageClient_serverCommands.elm = ['elm-language-server', '--stdio']
let g:LanguageClient_rootMarkers.elm = ['elm.json']

let g:elm_jump_to_error = 1
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 0


let g:tagbar_type_elm = {
    \ 'ctagstype' : 'ElmCustom',
    \ 'ctagsargs' : [ '--options='.$HOME.'/.config/ctags/', '-o-'],
    \ 'kinds'     : [
        \ 'm:Modules:0:0',
        \ 'i:Imports:0:0',
        \ 't:Types:0:0',
        \ 'a:Aliases:0:0',
        \ 'c:Constants:0:0',
        \ 'p:Ports:0:0',
        \ 'f:Functions:0:0',
        \ 'r:Records:0:0',
        \ 'y:Type constructors:0:0'
        \ ],
    \ 'sro'      : ':',
    \ 'kind2scope' : {},
    \ 'scope2kind' : {}
\ }

" vim: tabstop=2 softtabstop=2 shiftwidth=2
