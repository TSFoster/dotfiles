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
let s:_ = ['file', 'neosnippet', 'buffer']
let g:deoplete#sources = {}
let g:deoplete#sources._ = s:_

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

" }}}
" Github completion {{{

Plugin 'SevereOverfl0w/deoplete-github', { 'for': ['gitcommit'] }

let g:deoplete#sources.gitcommit = ['github']
let g:deoplete#keyword_patterns.gitcommit = '[^ \t]+'
let g:deoplete#omni#input_patterns.gitcommit = [g:deoplete#keyword_patterns.gitcommit]

" }}}
" Vim completion {{{

Plugin 'Shougo/neco-vim', { 'for': ['vim'] }
Plugin 'Shougo/neco-syntax', { 'for': ['vim'] }

let g:deoplete#sources.vim = ['vim'] + s:_

" }}}
" JS completion {{{

Plugin 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plugin 'carlitux/deoplete-ternjs', {
\   'for': ['javascript', 'javascript.jsx'],
\   'do': 'npm i -g tern'
\ }
Plugin 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

let g:deoplete#sources['javascript.jsx'] =  ['ternjs'] + s:_
let g:deoplete#omni#functions.javascript = ['tern#Complete', 'jspc#omni']

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" }}}
" ZSH completion {{{

Plugin 'Valodim/vim-zsh-completion', { 'for': ['zsh'] }

let g:deoplete#omni#functions.zsh = ['zsh_completion#Complete']
let g:deoplete#omni_patterns.zsh = '[^\t ]\+'
let g:deoplete#sources.zsh = ['zsh'] + s:_

" }}}
" PHP completion {{{

"Plugin 'pbogut/deoplete-padawan', { 'for': ['php'] }
"
"let g:deoplete#sources#padawan#server_addr = 'http://127.0.0.1:15155'
"let g:deoplete#sources#padawan#server_command = 'padawan-server'
"let g:deoplete#sources#padawan#log_file = '/Users/toby/padawan.log'
"let g:deoplete#sources#padawan#server_autostart = 1
"let g:deoplete#sources#padawan#add_parentheses = 1

let g:deoplete#omni#functions.php = ['phpcomplete#CompletePHP']
let g:deoplete#omni_patterns.php = '[^\t ]\+'

" }}}
" Ruby completion {{{

Plugin 'fishbullet/deoplete-ruby', { 'for': ['ruby'] }

let g:deoplete#sources.ruby = ['ruby'] + s:_

" }}}
" Elm completion {{{

let g:deoplete#omni#functions.elm = ['elm#Complete']
let g:deoplete#omni#input_patterns.elm = '[^ \t]+'
let g:deoplete#sources.elm = ['omni'] + s:_

" }}}
" Python completion {{{

Plugin 'zchee/deoplete-jedi'

let g:deoplete#sources.python = ['jedi'] + s:_

" }}}

" Plugin 'Shougo/neco-syntax'
" Plugin 'eagletmt/neco-ghc'
" Plugin 'landaire/deoplete-swift'
