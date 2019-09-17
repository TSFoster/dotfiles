Plugin 'mattn/emmet-vim'

augroup checkgotmpl
  autocmd!
  autocmd FileType html
        \ if filereadable(getcwd() . '/config.toml')
        \ | set ft=gohtmltmpl
        \ | endif
augroup END

" vim: tabstop=2 softtabstop=2 shiftwidth=2
