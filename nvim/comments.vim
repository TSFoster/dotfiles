Plugin 'tomtom/tcomment_vim'

highlight Comment cterm=italic gui=italic

augroup comments
  autocmd!
  autocmd ColorScheme * highlight Comment cterm=italic gui=italic
augroup END

" vim: tabstop=2 softtabstop=2 shiftwidth=2
