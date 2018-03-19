Plugin 'roxma/ncm-github', { 'for': ['gitcommit'] }

augroup git
  autocmd!
  autocmd BufNewFile,BufRead *.gitconfig* setfiletype gitconfig
augroup END

" vim: tabstop=2 softtabstop=2 shiftwidth=2
