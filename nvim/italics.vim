highlight htmlItalic cterm=italic
highlight Comment cterm=italic

augroup italics
  autocmd!
  autocmd ColorScheme * highlight htmlItalic gui=italic
  autocmd ColorScheme * highlight Comment gui=italic
augroup END

" vim: tabstop=2 softtabstop=2 shiftwidth=2
