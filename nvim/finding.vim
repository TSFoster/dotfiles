Plugin 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }

" ÷ is opt + / on macOS
nmap ÷ <Plug>(AerojumpBolt)

let g:aerojump_keymaps = {
  \ "<C-h>": "AerojumpSelPrev",
  \ "<Left>": "AerojumpSelPrev",
  \ "<C-j>": "AerojumpDown",
  \ "<Down>": "AerojumpDown",
  \ "<C-k>": "AerojumpUp",
  \ "<Up>": "AerojumpUp",
  \ "<C-l>": "AerojumpSelNext",
  \ "<Right>": "AerojumpSelNext",
  \ "<ESC>": "AerojumpExit",
  \ "<CR>": "AerojumpSelect"
\ }


Plugin 'tpope/vim-abolish'

set inccommand=nosplit

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

" vim: tabstop=2 softtabstop=2 shiftwidth=2
