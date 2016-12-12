autocmd BufNewFile,BufRead *.vimrc* setfiletype vim
autocmd BufReadPre *.vim setlocal foldmethod=marker


Plugin 'Shougo/neco-vim', { 'for': ['vim'] }
Plugin 'Shougo/neco-syntax', { 'for': ['vim'] }

let g:deoplete#sources.vim = ['vim'] + g:default_sources