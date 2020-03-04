let g:polyglot_disabled += ['markdown']

augroup markdown
  autocmd!
augroup END

if has('mac') && isdirectory("/Applications/Marked 2.app")
  Plugin 'itspriddle/vim-marked', { 'for': ['markdown'] }
  augroup markdown
    autocmd FileType markdown,mkd,ghmarkdown nnoremap <silent><buffer> <Leader>/m :MarkedToggle<CR>
  augroup END
endif

augroup markdown
  autocmd FileType markdown,mkd,ghmarkdown,md imap <buffer> <C-f> *
  autocmd FileType markdown,mkd,ghmarkdown,md imap <buffer> <C-d> **
  autocmd FileType markdown,mkd,ghmarkdown,md vmap <buffer> <C-i> S*
  autocmd FileType markdown,mkd,ghmarkdown,md vmap <buffer> <C-b> S*gvS*
  autocmd FileType markdown,mkd,ghmarkdown,md inoremap <buffer> ;` ```<CR><CR>```<Up><Up>
  autocmd FileType markdown,mkd,ghmarkdown,md setlocal spell spelllang=en_gb
  autocmd ColorScheme * highlight htmlItalic cterm=italic gui=italic
  autocmd ColorScheme * highlight htmlBold cterm=bold gui=bold
augroup END

highlight htmlItalic cterm=italic gui=italic
highlight htmlBold cterm=bold gui=bold

" vim: tabstop=2 softtabstop=2 shiftwidth=2
