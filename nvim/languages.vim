Plugin 'Shougo/context_filetype.vim'
Plugin 'Shougo/neco-syntax'
Plugin 'fszymanski/deoplete-emoji'
let g:context_filetype#filetypes = {}

Plugin 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
let g:LanguageClient_serverCommands = {}
let g:LanguageClient_rootMarkers = {}
nnoremap <F6> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F7> :call LanguageClient#textDocument_rename()<CR>


let g:polyglot_disabled = ['cryptol']

Source languages/crontab
Source languages/css
Source languages/csv
Source languages/docker
Source languages/elixir
Source languages/elm
Source languages/git
Source languages/go
Source languages/html
Source languages/javascript
Source languages/markdown
Source languages/php
Source languages/ruby
Source languages/rust
Source languages/shell
Source languages/swift
Source languages/vim
Source languages/yaml

Plugin 'sheerun/vim-polyglot'


" vim: tabstop=2 softtabstop=2 shiftwidth=2
