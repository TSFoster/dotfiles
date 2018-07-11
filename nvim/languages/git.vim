Plugin 'SevereOverfl0w/deoplete-github'

augroup git
  autocmd!
  autocmd BufNewFile,BufRead *.gitconfig* setfiletype gitconfig
augroup END

" vim: tabstop=2 softtabstop=2 shiftwidth=2
