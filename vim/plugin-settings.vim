" Ctrl-P
let g:ctrlp_working_path_mode = 'ra'

" Fugitive
if has("autocmd")
  " Delete hidden fugitive buffers
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif

" Gundo
let g:gundo_right = 1

" Surround
let g:surround_{char2nr('q')} = "\\\'\r\\\'"
let g:surround_{char2nr('Q')} = "\\\"\r\\\""
let g:surround_{char2nr('i')} = "\*\r\*"
let g:surround_{char2nr('I')} = "\*\*\r\*\*"

" Syntastic
let g:syntastic_always_populate_loc_list=1

" Ultisnips
let g:UltiSnipsExpandTrigger=";;"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-f>"

" Wildfire
let g:wildfire_objects = ["i'", 'i"', "i>", "i)", "i]", "il", "ai", "i}", "ip", "it"]

" YouCompleteMe
set omnifunc=syntaxcomplete#Complete
