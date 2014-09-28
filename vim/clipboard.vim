set pastetoggle=<F2>

if g:MachineType == 'Mac'
  vmap <Leader>y "*y
  vmap <Leader>d "*d
  nmap <Leader>d "*d
  nmap <Leader>d "*D
  nmap <Leader>p "*p
  nmap <Leader>P "*P
  vmap <Leader>p "*p
  vmap <Leader>P "*P
  " Move most recent unnamed change to Mac clipboard
  nmap <Leader>y :let @*=@"<CR>
  " Move most recent unnamed yank to Mac clipboard
  nmap <Leader><Leader>y :let @*=@0<CR>
endif

" Go to end of paste
vmap <silent> y y`]
vmap <silent> p p`]
nmap <silent> p p`]
