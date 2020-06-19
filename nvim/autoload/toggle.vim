" Toggle list windows
" Adapted from https://github.com/tpope/vim-unimpaired/issues/97#issuecomment-371219365

function toggle#quickfixList(...)
  if a:0 == 0 || !a:1
    for i in range(1, winnr('$'))
      let bnum = winbufnr(i)
      if getbufvar(bnum, '&buftype') == 'quickfix'
        cclose
        return
      endif
    endfor
  endif
  if a:0 == 0 || a:1 == 1
    copen
  endif
endfunction


function s:BufferCount() abort
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

function toggle#locationList(...)
  " https://github.com/Valloric/ListToggle/blob/master/plugin/listtoggle.vim
  let buffer_count_before = s:BufferCount()

  if !a:0 || !a:1
    " Location list can't be closed if there's cursor in it, so we need
    " to call lclose twice to move cursor to the main pane
    silent! lclose
    silent! lclose
  endif

  if s:BufferCount() == buffer_count_before && (!a:0 || a:1)
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

function toggle#tabs(...)
  if (!a:0 && &expandtab) || (a:0 && a:1)
    set noexpandtab
  else
    set expandtab
  end

  echo (&expandtab ? 'Spaces (' . &shiftwidth . ')' : 'Tabs (' . &tabstop . ')')
endfunction

function toggle#lion(...)
  if (!a:0 && g:lion_squeeze_spaces) || (a:0 && !a:1)
    let g:lion_squeeze_spaces = 0
    echo 'Don’t squeeze spaces'
  else
    let g:lion_squeeze_spaces = 1
    echo 'Squeeze spaces'
  end
endfunction
