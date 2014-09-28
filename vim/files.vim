set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
set spelllang=en_gb

" Sudo-write a file
command! W w !sudo tee % > /dev/null " Sudo write file

" Bring up diff of current buffer to last save
command! DiffOrig let g:diffline = line('.')
  \ | vert new
  \ | set bt=nofile
  \ | r #
  \ | 0d_
  \ | diffthis
  \ | :exe "norm! ".g:diffline."G"
  \ | wincmd p
  \ | diffthis
  \ | wincmd p

" Diff Original, Diff Close
nnoremap <Leader>do :DiffOrig<CR>
nnoremap <Leader>dc :q<CR>:diffoff<CR>:exe "norm! ".g:diffline."G"<CR>

" Edit RC file, source RC file
nnoremap <Leader>erc :tabnew $HOME/.dotfiles/vim/main.vimrc<CR>
nnoremap <Leader>rc :source $MYVIMRC<CR>

" GO to Alfred. Opens current file in Alfred and displays action menu
nnoremap goa :silent! !osascript $HOME/.dotfiles/applescript/open_file_in_alfred.scpt '%:p'<CR>:redraw!<CR>

" Turn spelling on for text files
autocmd FileType md,mkd,markdown,mmd,txt,text set spell
