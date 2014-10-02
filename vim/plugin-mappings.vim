" Ctrl-P
nnoremap <Leader>o :CtrlPCurWD<CR>
nnoremap <Leader>O :CtrlPCurFile<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap glt :CtrlPBufTag<CR>
nnoremap gbt :CtrlPBufTagAll<CR>
nnoremap gt  :CtrlPTag<CR>
" }}}

" Drag Visuals {{{
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
" }}}

" Gundo {{{
nnoremap <F5> :GundoToggle<CR>
" }}}

" Tabularize {{{
nnoremap <Tab> :Tabularize /
" }}}

" Wildfire {{{
map <Leader>s <Plug>(wildfire-quick-select)
map <Leader>v <Plug>(wildfire-fuel)
map <Leader>V <Plug>(wildfire-water)
" }}}
