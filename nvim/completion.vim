" Deoplete setup {{{

Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'Shougo/context_filetype.vim'
Plugin 'Shougo/echodoc.vim'
Plugin 'Shougo/neopairs.vim'
Plugin 'Shougo/echodoc.vim'


set completeopt=longest,menuone,preview
let g:echodoc_enable_at_startup = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let g:deoplete#auto_complete_delay = 50
let g:deoplete#auto_complete_start_length = 1

let g:deoplete#file#enable_buffer_path = 1

let g:deoplete#omni#functions = {}
let g:deoplete#keyword_patterns = {}
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni_patterns = {}
let g:deoplete#sources = {}
let g:deoplete#sources._ = g:default_sources

Plugin 'ervandew/supertab'
let g:SuperTabClosePreviewOnPopupClose = 1

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

imap <expr><S-TAB>
 \ pumvisible() ? "\<C-p>" :
 \ "\<S-TAB>"
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Plugin 'eagletmt/neco-ghc'
" Plugin 'landaire/deoplete-swift'
