Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'junegunn/gv.vim'

let g:fugitive_git_executable='command git'

nnoremap <silent> <Leader>ga :Gwrite<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gps :Gpush<CR>
nnoremap <silent> <Leader>gpl :Gpull<CR>
nnoremap <silent> <Leader>gco :Gcommit<CR>
nnoremap <silent> <Leader>gca :Gcommit --amend<CR>
nnoremap <silent> <Leader>gre :<C-U>execute("Grebase -i HEAD~" . v:count1)<CR>

nnoremap <silent> <Leader>gi :CocList gitignore<CR>
nnoremap <silent> <Leader>ge :CocList gstatus<CR>
nnoremap <silent> <Leader>gE :CocList gfiles<CR>
nnoremap <silent> <Leader>gC :CocList commits<CR>

" navigate hunks of current buffer
nmap [h <Plug>(coc-git-prevchunk)
nmap ]h <Plug>(coc-git-nextchunk)
nmap <Leader>hp <Plug>(coc-git-chunkinfo)
nmap <Leader>ha :CocCommand git.chunkStage<CR>
nmap <Leader>hu :CocCommand git.chunkUndo<CR>
" show commit contains current position
nmap <Leader>cp <Plug>(coc-git-commit)
" create text object for git chunks
omap ic <Plug>(coc-text-object-inner)
xmap ic <Plug>(coc-text-object-inner)
omap ac <Plug>(coc-text-object-outer)
xmap ac <Plug>(coc-text-object-outer)

augroup gitremote
  autocmd!
  autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
augroup END

" vim: tabstop=2 softtabstop=2 shiftwidth=2
