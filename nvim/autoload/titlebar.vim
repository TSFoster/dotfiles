function titlebar#init()
  set t_ts=k
  set t_fs=\

  augroup titlebar_naming
    autocmd!
    autocmd VimLeave * :set t_ts=k\
    autocmd BufEnter * :call <SID>SetTitlestring()
    autocmd BufEnter * :call <SID>WatchForTermTitle()
    autocmd BufLeave * :call <SID>StopWatchingForTermTitle()
  augroup end
endfunction

function s:SetTitlestring(...)
  set title
  if &buftype == 'terminal'
    let &titlestring = b:term_title
  else
    let cwd = getcwd()
    let fp = expand('%:p')
    if fp == '' || fp =~? '^'.$VIMRUNTIME
      let &titlestring = cwd
    else
      let &titlestring = fp
    end
  end
endfunction

let s:timerid = 0
function s:WatchForTermTitle()
  if s:timerid > 0
    call timer_stop(s:timerid)
    let s:timerid = 0
  end
  if &buftype == 'terminal'
    let s:timerid = timer_start(5000, 'SetTitlestring', {'repeat': -1})
  end
endfunction

function! s:StopWatchingForTermTitle()
  if s:timerid > 0
    call timer_stop(s:timerid)
    let s:timerid = 0
  end
endfunction
