Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'airblade/vim-gitgutter'

let g:gitgutter_override_sign_column_highlight = 0

nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gps :Gpush<CR>
nnoremap <Leader>gpl :Gpull<CR>
nnoremap <Leader>gco :Gcommit<CR>
nnoremap <Leader>gca :Gcommit --amend<CR>
nnoremap <Leader>gre :<C-U>execute("terminal git rebase -i HEAD~" . v:count1)<CR>
