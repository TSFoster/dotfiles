let g:polyglot_disabled += ['markdown']

if has('mac')
  Plugin 'itspriddle/vim-marked'
  autocmd FileType markdown,mkd,ghmarkdown nnoremap <silent><buffer> <Leader>/m :MarkedToggle<CR>
endif

augroup markdown
  autocmd!
  autocmd FileType markdown,mkd,ghmarkdown imap <buffer> <C-f> *
  autocmd FileType markdown,mkd,ghmarkdown imap <buffer> <C-d> **
  autocmd FileType markdown,mkd,ghmarkdown vmap <buffer> <C-i> S*
  autocmd FileType markdown,mkd,ghmarkdown vmap <buffer> <C-b> S*gvS*
  autocmd ColorScheme * highlight htmlItalic cterm=italic gui=italic
  autocmd ColorScheme * highlight htmlBold cterm=bold gui=bold
augroup END

highlight htmlItalic cterm=italic gui=italic
highlight htmlBold cterm=bold gui=bold
