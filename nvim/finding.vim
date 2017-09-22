Plugin 'tpope/vim-abolish'

set inccommand=split

function! CycleIncCommand()
  if &inccommand == 'nosplit'
    set inccommand=split
  elseif &inccommand == 'split'
    set inccommand=
  else
    set inccommand=nosplit
  endif
endfunction

" Follows vim-unimpaired’s *c*hange *o*ption format
nmap <silent><expr> coS CycleIncCommand()
