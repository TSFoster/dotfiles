Plugin 'SevereOverfl0w/deoplete-github', { 'for': ['gitcommit'] }

let g:deoplete#sources.gitcommit = ['github']
let g:deoplete#keyword_patterns.gitcommit = '[^ \t]+'
let g:deoplete#omni#input_patterns.gitcommit = [g:deoplete#keyword_patterns.gitcommit]

autocmd BufNewFile,BufRead *.gitconfig* setfiletype gitconfig
