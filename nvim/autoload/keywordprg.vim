function keywordprg#run(word)
  if exists('*CocHasProvider') && CocHasProvider('hover')
    call CocAction('doHover')
  elseif count(['vim','help'], &filetype)
    execute 'h '.expand('<cword>')
  elseif &filetype == 'fish'
    " Fish uses a function for man, which includes more manpages. `:Man` doesn't
    " use fish's `man` by default, so use this to get manpage location
    execute 'Man ' . system('man -w ' . expand('<cword>'))
  elseif count(['shell', 'sh', 'bash', 'zsh'], &filetype)
    execute 'Man ' . expand('<cword>')
  elseif !exists('$SSH_CLIENT')
    call system('search ' . a:word)
  else
    echoerr 'Don’t know what keyword program to use'
  endif
endfunction
