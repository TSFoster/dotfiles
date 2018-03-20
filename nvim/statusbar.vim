set statusline=%{SetStatusColorsByMode(mode())}%1* " Hack(?) to change statusbar color based on mode
set statusline+=\ %<%F                             " File path
set statusline+=\ [%n]                             " Buffer number
set statusline+=\ %y                               " File type
set statusline+=\ %m%r%w                           " Modified? Read-only? Preview?
set statusline+=%=                                    " ------------------------------
set statusline+=\ [(%l:%v)/%L]                     " Row:col number/total lines (%)
set statusline+=\ [%{''.(&fenc!=''?&fenc:&enc).''} " File encoding
set statusline+=\%{(&bomb?\",\ BOM\":\"\")}        " Byte order mark
set statusline+=\%{(&paste?\",\ PASTE\":\"\")}]    " Paste mode
set statusline+=\ [%{&spelllang}]                  " Language
set statusline+=\ [%{mode()}]                      " Mode

set noshowmode  " This is covered by the statusline now

function! SetStatusColorsByMode(mode)
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

" vim: tabstop=2 softtabstop=2 shiftwidth=2
