function statusline#init()
  set statusline=%{statusline#_set_status_colors_by_mode(mode())}%1* " Hack(?) to change statusbar color based on mode
  set statusline+=\%{statusline#_coc_status()}                       " coc.nvim
  set statusline+=\ %<%F                                             " File path
  set statusline+=\%{statusline#_current_function()}                 " coc.nvim
  set statusline+=\ [%n]                                             " Buffer number
  set statusline+=\ %y                                               " File type
  set statusline+=\ %m%r%w                                           " Modified? Read-only? Preview?
  set statusline+=%=                                                 " ------------------------------
  set statusline+=\ [(%l:%v)/%L]                                     " Row:col number/total lines (%)
  set statusline+=\ [%{''.(&fenc!=''?&fenc:&enc).''}                 " File encoding
  set statusline+=\%{(&bomb?\",\ BOM\":\"\")}                        " Byte order mark
  set statusline+=\%{(&paste?\",\ PASTE\":\"\")}]                    " Paste mode
  set statusline+=\ [%{&spelllang}]                                  " Language
  set statusline+=\ [%{mode()}]                                      " Mode

  set noshowmode  " This is covered by the statusline now
endfunction

function statusline#_coc_status()
  if !exists('*coc#status') || coc#status() == ''
    return ''
  endif
  return ' [' . coc#status() . ']'
endfunction

function statusline#_current_function()
  let cf = get(b:, 'coc_current_function', '')
  if cf == ''
    return ''
  endif
  return ':' . cf . ''
endfunction

function statusline#_set_status_colors_by_mode(mode)
  if a:mode=='n' || a:mode=='no'
    highlight! link User1 StatusLineNormal
  elseif a:mode=='i'
    highlight! link User1 StatusLineInsert
  elseif a:mode=='v' || a:mode=='V' || a:mode==''
    highlight! link User1 StatusLineVisual
  elseif a:mode=='t'
    highlight! link User1 StatusLineTerm
  else
    highlight! link User1 StatusLine
  endif
  return ''
endfunction
