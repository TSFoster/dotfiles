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
nnoremap <Leader>re :tabnew $HOME/.dotfiles/vim/main.vim<CR>
nnoremap <Leader>rc :source $MYVIMRC<CR>

" GO to Alfred. Opens current file in Alfred and displays action menu
nnoremap goa :silent! !osascript $HOME/.dotfiles/applescript/open_file_in_alfred.scpt '%:p'<CR>:redraw!<CR>

" Delete file and buffer
command! -bang DeleteFileAndBuffer if <bang>0
      \ |   :call delete(expand('%'))
      \ |   bdelete!
      \ | else
      \ |   :echoerr 'You are about to delete a buffer and a file. Add ! to show you''re serious'
      \ | endif

" Turn spelling on for text files
autocmd FileType md,mkd,markdown,mmd,txt,text set spell

" Use q to quit a helpfile
autocmd BufWinEnter * if &l:buftype ==# 'help' | map <buffer> q :q<CR> | endif

" Shortcuts for quickfix windows
autocmd BufWinEnter * if &l:buftype ==# 'quickfix'
      \ |   nnoremap <buffer> q :q<CR>
      \ |   nnoremap <buffer> o <CR>
      \ | endif
