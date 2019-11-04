augroup formatting
  autocmd BufWritePre * call <SID>maybe_format()
augroup END

function! s:maybe_format()
  if (!exists("g:no_autoformat") || !g:no_autoformat) && CocHasProvider("format")
    echom "Formatting…"
    call CocAction("format")
  endif
endfunction

nnoremap <silent> yof :call <SID>toggle_auto_format()<CR>

function! s:toggle_auto_format()
  if !exists('g:no_autoformat')
    let g:no_autoformat = 0
  endif
  let g:no_autoformat = !g:no_autoformat
  if g:no_autoformat
    echom "Don’t fix on save"
  else
    echom "Fix on save"
  end
endfunction
