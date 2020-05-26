" Toggle list windows
" Adapted from https://github.com/tpope/vim-unimpaired/issues/97#issuecomment-371219365

function toggle#quickfixList()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor
  copen
endfunction


function s:BufferCount() abort
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

function toggle#locationList()
  " https://github.com/Valloric/ListToggle/blob/master/plugin/listtoggle.vim
  let buffer_count_before = s:BufferCount()

  " Location list can't be closed if there's cursor in it, so we need
  " to call lclose twice to move cursor to the main pane
  silent! lclose
  silent! lclose

  if s:BufferCount() == buffer_count_before
    silent! lopen
    if s:BufferCount() == buffer_count_before
      echo 'No items in location list'
    endif
  endif
endfunction

function toggle#inccommand()
  if &inccommand == 'nosplit'
    set inccommand=split
    echom "Show split"
  elseif &inccommand == 'split'
    set inccommand=
    echom "No previews"
  else
    set inccommand=nosplit
    echom "Preview but no split"
  endif
endfunction
