" Ctrl-P {{{
nnoremap <Leader>o :CtrlPMixed<CR>
nnoremap <Leader>e :CtrlPCurWD<CR>
nnoremap <Leader>E :CtrlPCurFile<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>tb :CtrlPBufTag<CR>
nnoremap <Leader>ta :CtrlPBufTagAll<CR>
nnoremap <Leader>tt :CtrlPTag<CR>
nnoremap <Leader>ll :CtrlPLine<CR>
nnoremap <Leader>lc :CtrlPChange<CR>
nnoremap <Leader>lC :CtrlPChangeAll<CR>
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
if has('mac')
  map √ <Plug>(wildfire-fuel)
  map ◊ <Plug>(wildfire-water)
else
  map <A-v> <Plug>(wilfire-fuel)
  map <A-v> <Plug>(wilfire-water)
endif
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
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>gps :Dispatch! git push<CR>
nnoremap <Leader>gpl :Dispatch! git pull<CR>
nnoremap <Leader>gmv :Gmove<Space>
nnoremap <Leader>gbl :Gblame<CR>
nnoremap <Leader>gbr :Git checkout -b<Space>
nnoremap <Leader>ggh :Gbrowse<CR>
vnoremap <Leader>ggh :Gbrowse<CR>
autocmd User fugitive if fugitive#buffer().type() =~# '^\%(tree\|blob\)$'
  \ |   nnoremap <buffer> .. :edit %:h<CR>
  \ | endif
" }}}

" Dash.vim {{{
if has('mac')
  map <Leader>K <Plug>DashSearch
endif
" }}}

" Incsearch.vim {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" }}}

" Ag.vim/Ack.vim {{{
nnoremap <Leader>a :Ag ''<Left>
nnoremap <Leader>A :Ack ''<Left>
" }}}
