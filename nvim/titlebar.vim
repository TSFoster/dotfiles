set t_ts=k
set t_fs=\

function! SetTitlestring(...)
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
function! WatchForTermTitle()
  if s:timerid > 0
    call timer_stop(s:timerid)
    let s:timerid = 0
  end
  if &buftype == 'terminal'
    let s:timerid = timer_start(5000, 'SetTitlestring', {'repeat': -1})
  end
endfunction

function! StopWatchingForTermTitle()
  if s:timerid > 0
    call timer_stop(s:timerid)
    let s:timerid = 0
  end
endfunction

augroup titlebar_naming
  autocmd!
  autocmd VimLeave * :set t_ts=k\
  autocmd BufEnter * :call SetTitlestring()
  autocmd BufEnter * :call WatchForTermTitle()
  autocmd BufLeave * :call StopWatchingForTermTitle()
augroup end

" vim: tabstop=2 softtabstop=2 shiftwidth=2
