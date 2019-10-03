Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'rbong/vim-flog'

let g:fugitive_git_executable='command git'

nnoremap <silent> <Leader>ga :Gwrite<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gps :Gpush<CR>
nnoremap <silent> <Leader>gpl :Gpull<CR>
nnoremap <silent> <Leader>gco :Gcommit<CR>
nnoremap <silent> <Leader>gca :Gcommit --amend<CR>
nnoremap <silent> <Leader>gre :<C-U>execute("Grebase -i HEAD~" . v:count1)<CR>

if executable('gittower')
  nnoremap <silent> <Leader>gt :call system('tower')<CR>
endif

" vim: tabstop=2 softtabstop=2 shiftwidth=2
