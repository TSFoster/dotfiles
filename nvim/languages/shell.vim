augroup shellscripting
  autocmd!
  autocmd BufNewFile,BufRead *.zshrc      setfiletype zsh
  autocmd BufNewFile,BufRead *.shrc       setfiletype sh
  autocmd BufNewFile,BufRead *.zshenv     setfiletype zsh
  autocmd BufNewFile,BufRead *.bashrc*    setfiletype bash
augroup END


Plugin 'Valodim/vim-zsh-completion', { 'for': ['zsh'] }

let g:deoplete#omni#functions.zsh = ['zsh_completion#Complete']
let g:deoplete#omni_patterns.zsh = '[^\t ]\+'
let g:deoplete#sources.zsh = ['zsh'] + g:default_sources
