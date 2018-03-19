Plugin 'machakann/vim-highlightedyank'

set clipboard=unnamed
set pastetoggle=<F2>

Plugin 'bfredl/nvim-miniyank'
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <Leader>y <Plug>(miniyank-cycle)

" Alt-R to paste buffer in terminal mode
tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" vim: tabstop=2 softtabstop=2 shiftwidth=2
