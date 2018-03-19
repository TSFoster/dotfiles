augroup shellscripting
  autocmd!
  autocmd BufNewFile,BufRead *.zshrc      setfiletype zsh
  autocmd BufNewFile,BufRead *.shrc       setfiletype sh
  autocmd BufNewFile,BufRead *.zshenv     setfiletype zsh
  autocmd BufNewFile,BufRead *.bashrc*    setfiletype bash
augroup END

" vim: tabstop=2 softtabstop=2 shiftwidth=2
