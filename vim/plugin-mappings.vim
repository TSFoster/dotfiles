" Ctrl-P {{{
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

" Tagbar {{{
nmap <F6> :TagbarToggle<CR>
" }}}

" Tabularize {{{
nnoremap <Tab> :Tabularize /
" }}}

" Wildfire {{{
map <Leader>s <Plug>(wildfire-quick-select)
map <Leader>v <Plug>(wildfire-fuel)
map <Leader>V <Plug>(wildfire-water)
" }}}

" Neocomplete {{{
" <CR>: Expand UltiSnips or send carriage return
inoremap <silent><expr><CR> (pumvisible() ?
    \ (len(keys(UltiSnips#SnippetsInCurrentScope())) > 0 ?
    \ neocomplete#close_popup()."<C-r>=UltiSnips#ExpandSnippet()" :
    \ neocomplete#close_popup()) : "")."\<CR>"

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()

let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]
" }}}

" Fugitive {{{
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gg :Ggrep<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>
" }}}
