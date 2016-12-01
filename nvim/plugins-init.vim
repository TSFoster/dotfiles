let g:plugins = []
function! Plugin(...)
  let opts = {}
  if (a:0 > 1)
    let opts = a:2
  endif
  let g:plugins += [[a:1, opts]]
endfunction
command! -nargs=+ Plugin call Plugin(<args>)
