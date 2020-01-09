Plugin 'wellle/visual-split.vim'

set splitbelow
set splitright

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

nnoremap <A-w> :Windows<CR>
tnoremap <A-w> <C-\><C-n>:Windows<CR>

tnoremap ;; <C-\><C-n>:
tnoremap jj <C-\><C-n>
tmap <A-Space> <C-\><C-n><Leader>
nmap <A-Space> <Leader>

" Open new file below/above/to left/to right/inside current window
nnoremap <Leader>nj :rightbelow new <CR>
nnoremap <Leader>nk :leftabove new <CR>
nnoremap <Leader>nl :rightbelow vnew <CR>
nnoremap <Leader>nh :leftabove vnew <CR>
nnoremap <Leader>nn :enew<CR>
nnoremap <Leader>nN :tabnew<CR>

" Open terminal below/above/to left/to right/inside current window
nnoremap <Leader>tj :sp <BAR> term<CR>
nnoremap <Leader>tk :topleft sp <BAR> term<CR>
nnoremap <Leader>tl :vsp <BAR> term<CR>
nnoremap <Leader>th :leftabove vsp <BAR> term<CR>
nnoremap <Leader>tt :term<CR>
nnoremap <Leader>tT :tabnew <BAR> term<CR>

" Resize windows with alt+dir or equalise with alt+=
nnoremap <A-h> <C-w><
nnoremap <A-j> <C-w>-
nnoremap <A-k> <C-w>+
nnoremap <A-l> <C-w>>
nnoremap <A-=> <C-w>=
tnoremap <A-h> <C-\><C-n><C-w><i
tnoremap <A-j> <C-\><C-n><C-w>-i
tnoremap <A-k> <C-\><C-n><C-w>+i
tnoremap <A-l> <C-\><C-n><C-w>>i
tnoremap <A-=> <C-\><C-n><C-w>=i

" Automatically enter insert mode in terminal if it's not been scrolled back
augroup terminal_insert
  autocmd!
  autocmd BufEnter * if &buftype == 'terminal' && line('$') == line('w$') | :startinsert | endif
  autocmd TermOpen * if &buftype == 'terminal' | :startinsert | endif
augroup END

" vim: tabstop=2 softtabstop=2 shiftwidth=2
