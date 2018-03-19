highlight htmlItalic cterm=italic
highlight Comment cterm=italic

augroup italics
  autocmd!
  autocmd ColorScheme * highlight htmlItalic gui=italic
  autocmd ColorScheme * highlight Comment gui=italic
augroup END
