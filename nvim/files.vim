Plugin 'artnez/vim-wipeout'

set spelllang=en_gb

function! MoveFile(newspec)
     let old = expand('%')
     if (old == a:newspec)
         return 0
     endif
     exe 'sav' fnameescape(a:newspec)
     call delete(old)
     exe 'bd ' old
endfunction
command! -nargs=1 -complete=file -bar MoveFile call MoveFile('<args>')

command! -bang DeleteFileAndBuffer if <bang>0
      \ |   :call delete(expand('%'))
      \ |   bdelete!
      \ | else
      \ |   :echoerr 'You are about to delete a buffer and a file. Add ! to show you''re serious'
      \ | endif


Plugin 'Valloric/ListToggle'

let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>L'

Plugin 'tpope/vim-vinegar'

