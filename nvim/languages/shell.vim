Plugin 'itspriddle/vim-shellcheck'

augroup shellscripting
  autocmd!
  autocmd BufNewFile,BufRead *.zshrc      setfiletype zsh
  autocmd BufNewFile,BufRead *.zshenv     setfiletype zsh
  autocmd BufNewFile,BufRead *.shrc       setfiletype sh
  autocmd BufNewFile,BufRead *.bashrc*    setfiletype sh
augroup END

let g:LanguageClient_serverCommands.sh = ['bash-language-server', 'start']

" vim: tabstop=2 softtabstop=2 shiftwidth=2
