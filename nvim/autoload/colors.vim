function colors#init()
  let g:colors_name = 'base16-strange_harmony'

  command! ReverseBackground call <SID>ReverseBackground()
  command! SetDark call <SID>SetDark()
  command! SetLight call <SID>SetLight()

  nnoremap <silent> <F11> :ReverseBackground<CR>

  if join(readfile($XDG_DATA_HOME . "/dark_mode")) == "true"
    SetDark
  else
    SetLight
  endif
endfunction

function s:SetLight()
  set background=light
endfunction

function s:SetDark()
  set background=dark
endfunction


function! s:ReverseBackground()
  if &background=="light"
    SetDark
  else
    SetLight
  endif
endfunction
