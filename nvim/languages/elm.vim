let g:polyglot_disabled += ['elm']

Plugin 'ElmCast/elm-vim', { 'for': ['elm'] }

let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1

let g:deoplete#omni#functions.elm = ['elm#Complete']
let g:deoplete#omni#input_patterns.elm = '[^ \t]+'
let g:deoplete#sources.elm = ['omni'] + g:default_sources

