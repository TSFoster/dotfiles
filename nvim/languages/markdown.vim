let g:polyglot_disabled += ['markdown']

augroup markdown
  autocmd!
augroup END

if has('mac')
  Plugin 'itspriddle/vim-marked', { 'for': ['markdown'] }
  augroup markdown
    autocmd FileType markdown,mkd,ghmarkdown nnoremap <silent><buffer> <Leader>/m :MarkedToggle<CR>
  augroup END
endif

augroup markdown
  autocmd FileType markdown,mkd,ghmarkdown imap <buffer> <C-f> *
  autocmd FileType markdown,mkd,ghmarkdown imap <buffer> <C-d> **
  autocmd FileType markdown,mkd,ghmarkdown vmap <buffer> <C-i> S*
  autocmd FileType markdown,mkd,ghmarkdown vmap <buffer> <C-b> S*gvS*
  autocmd ColorScheme * highlight htmlItalic cterm=italic gui=italic
  autocmd ColorScheme * highlight htmlBold cterm=bold gui=bold
augroup END

highlight htmlItalic cterm=italic gui=italic
highlight htmlBold cterm=bold gui=bold

" vim: tabstop=2 softtabstop=2 shiftwidth=2
