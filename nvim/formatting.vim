augroup formatting
  autocmd BufWritePre * call <SID>maybe_format()
augroup END

function! s:maybe_format()
  if (!exists("b:no_autoformat") || !b:no_autoformat) && CocHasProvider("format")
    call CocAction("format")
  endif
endfunction

nnoremap <silent> yof :call <SID>toggle_auto_format()<CR>

function! s:toggle_auto_format()
  if !exists('b:no_autoformat')
    let b:no_autoformat = 0
  endif
  let b:no_autoformat = !b:no_autoformat
  if b:no_autoformat
    echom "Don’t fix on save"
  else
    echom "Fix on save"
  end
endfunction
