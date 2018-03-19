Plugin 'SevereOverfl0w/deoplete-github', { 'for': ['gitcommit'] }

let g:deoplete#sources.gitcommit = ['github']
let g:deoplete#keyword_patterns.gitcommit = '[^ \t]+'
let g:deoplete#omni#input_patterns.gitcommit = [g:deoplete#keyword_patterns.gitcommit]

augroup git
  autocmd!
  autocmd BufNewFile,BufRead *.gitconfig* setfiletype gitconfig
augroup END

" vim: tabstop=2 softtabstop=2 shiftwidth=2
