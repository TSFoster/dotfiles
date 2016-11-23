" Ctrl-P {{{
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'node_modules\|\.DS_Store\|\.git$'
" }}}

" Fugitive {{{
" Delete hidden fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}

" Gundo {{{
let g:gundo_right = 1
" }}}

" Surround {{{
let g:surround_{char2nr('q')} = "\\\'\r\\\'"
let g:surround_{char2nr('Q')} = "\\\"\r\\\""
let g:surround_{char2nr('i')} = "\*\r\*"
let g:surround_{char2nr('I')} = "\*\*\r\*\*"
" }}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
" }}}

" Ultisnips {{{
let g:UltiSnipsExpandTrigger=";;"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
" }}}

" Wildfire {{{
let g:wildfire_objects = ["i'", 'i"', "i>", "i)", "i]", "il", "ai", "i}", "ip", "it"]
" }}}

" Neocomplete {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#sources#dictionary#dictionaries = { 'default' : '' }
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if filereadable("/usr/share/dict/words")
  let g:neocomplcache_dictionary_filetype_lists='/usr/share/dict/words'
endif

" Always use completions from all buffers
if !exists('g:neocomplete#same_filetypes')
  let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes._ = '_'

" Ignore completion when writing markdown
if !exists('g:neocomplete#disabled_filetypes')
  let g:neocomplete#disabled_filetypes = {}
endif
let g:neocomplete#disabled_filetypes.markdown = 1

set omnifunc=syntaxcomplete#Complete
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c    = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp  = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::\w*'
let g:neocomplete#sources#omni#input_patterns.php  = '[^. \t]->\h\w*\|\h\w*::\w*'
" }}}

" CanIUse {{{
let g:caniuse_no_mappings = 1
" }}}

" CoVim {{{
let CoVim_default_name = 'toby'
let CoVim_default_port = 1234
" }}}

" Gist-vim {{{
if has('mac')
  let g:gist_clip_command = 'pbcopy'
elseif has('unix')
  let g:gist_clip_command = 'xclip -selection clipboard'
else
  let g:gist_clip_command = 'putclip'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
" }}}

" Turbux {{{
let g:no_turbux_mappings = 1
map <Leader>rt <Plug>SendTestToTmux
map <Leader>RT <Plug>SendFocusedTestToTmux
" }}}

" Incsearch.vim {{{
set hlsearch
let g:incsearch#auto_nohlsearch = 1
" }}}

" Vim-instant-markdown {{{
let g:instant_markdown_autostart = 0
" }}}

" Ctrlp bdelete {{{
call ctrlp_bdelete#init()
" }}}
