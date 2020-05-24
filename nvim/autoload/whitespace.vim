function whitespace#set(tabstop)
  if a:tabstop > 0
    let &softtabstop = a:tabstop
    let &tabstop = a:tabstop
    let &shiftwidth = a:tabstop
  endif
endfunction
