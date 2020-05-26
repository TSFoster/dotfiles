function formatting#init()
  nnoremap <silent> yof :call <SID>global_autoformat()<CR>
  nnoremap <silent> yoF :call <SID>buffer_autoformat()<CR>

  augroup formatting
    autocmd!
    autocmd BufWritePre * call <SID>maybe_format()
    autocmd FileType * call <SID>setup_formatexpr()
  augroup END
endfunction

function s:maybe_format()
  " If g:no_autoformat is set, it either needs to be false or b:no_autoformat should be overwriting it with a false
  if (!exists("g:no_autoformat") || !g:no_autoformat || (exists("b:no_autoformat") && b:no_autoformat)) && (!exists("b:no_autoformat") || !b:no_autoformat) && exists('*CocHasProvider') && CocHasProvider("format")
    echom "Formatting…"
    call CocAction("format")
  endif
endfunction

function s:buffer_autoformat()
  let globalSetting = get(g:, 'no_autoformat', 0)
  if !exists("b:no_autoformat")
    let b:no_autoformat = !globalSetting
  elseif b:no_autoformat == !globalSetting
    let b:no_autoformat = globalSetting
  else
    unlet b:no_autoformat
  end
  if !exists("b:no_autoformat")
    echom "Use global setting (" .. (globalSetting ? "no auto-format" : "auto-format") .. ")"
  elseif b:no_autoformat
    echom "Do not auto-format buffer"
  else
    echom "Auto-format buffer"
  endif
endfunction

function s:global_autoformat()
  let g:no_autoformat = !get(g:, 'no_autoformat', 0)
  echom "Do" .. (g:no_autoformat ? " not " : " ") .. "auto-format" .. (exists('b:no_autoformat') ? " (overridden in this buffer)" : "")
endfunction

function s:toggle_auto_format(scope)
  let a:scope['no_autoformat'] = !get(a:scope, 'no_autoformat', 0)
  let globalAutoformat = get(g:, 'no_autoformat', 0)
  let bufferAutoformat = get(b:, 'no_autoformat', 0)
  echom (globalAutoformat ? "F" : "Don’t f") .. "ormat buffers on write, " .. (globalAutoformat == bufferAutoformat ? "including this buffer" : "but " .. (bufferAutoformat ? "do" : "not") .. " with this buffer")
endfunction

function s:setup_formatexpr()
  if exists('*CocHasProvider') && CocHasProvider('format')
    setlocal formatexpr=CocAction('formatSelected')
  endif
endfunction
