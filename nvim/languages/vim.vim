augroup vimscripting
  autocmd!
  autocmd BufNewFile,BufRead *.vimrc* setfiletype vim
  autocmd BufReadPre *.vim setlocal foldmethod=marker
augroup END

Plugin 'tpope/vim-scriptease'

Plugin 'Shougo/neco-vim', { 'for': ['vim'] }
Plugin 'Shougo/neco-syntax', { 'for': ['vim'] }

let g:deoplete#sources.vim = ['vim'] + g:default_sources

" vim: tabstop=2 softtabstop=2 shiftwidth=2
