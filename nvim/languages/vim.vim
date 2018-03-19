augroup vimscripting
  autocmd!
  autocmd BufNewFile,BufRead *.vimrc* setfiletype vim
  autocmd BufReadPre *.vim setlocal foldmethod=marker
augroup END

Plugin 'tpope/vim-scriptease'

Plugin 'Shougo/neco-vim', { 'for': ['vim'] }
Plugin 'Shougo/neco-syntax', { 'for': ['vim'] }

" vim: tabstop=2 softtabstop=2 shiftwidth=2
