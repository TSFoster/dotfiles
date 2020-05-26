function buffer#update()
  try
    update
  catch /E212/
    if confirm('Directory doesn’t exist, should it be created?', "&Yes\n&No", 2, "question") == 1
      silent !mkdir -p %:h
      write
    endif
  endtry
endfunction

function buffer#quit()
  if (winnr('$') == 1 && tabpagenr('$') == 1)
    if confirm('Are you sure you want to quit?', "&Yes\n&No", 2, "Question") == 1
      quit
    endif
  else
    quit
  endif
endfunction

function buffer#init_pager()
  set bufhidden=delete
  filetype detect
endfunction

" from https://github.com/artnez/vim-wipeout/blob/master/plugin/wipeout.vim
function buffer#wipeout(bang)
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that are loaded and not visible
  let l:tally = 0
  let l:skips = 0
  let l:cmd = 'bw'
  if a:bang
    let l:cmd .= '!'
  endif
  for b in range(1, bufnr('$'))
    if buflisted(b) && !has_key(visible, b)
      if getbufvar(b, "&mod")
        let l:skips += 1
        continue
      endif
      let l:tally += 1
      exe l:cmd . ' ' . b
    endif
  endfor
  let l:msg = "Deleted " . l:tally . " buffer" . (l:tally == 1 ? "" : "s")
  if l:skips
    let l:msg .= ", skipped " . l:skips . " modified buffer" . (l:skips == 1 ? "" : "s")
  endif
  echon l:msg
endfunction
