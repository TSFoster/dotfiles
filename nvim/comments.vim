Plugin 'tomtom/tcomment_vim'

highlight Comment cterm=italic gui=italic

augroup comments
  autocmd!
  autocmd ColorScheme * highlight Comment cterm=italic gui=italic
augroup END
