" Space is a great <Leader>.
" It is a large button that can be hit by either hand without moving
let mapleader="\<Space>"

" jj is a rare combination that stays on the home row and is faster than
" hitting <C-[> or <ESC>
inoremap jj <ESC>

" Semi-colon is much faster to type than colon. Replace semi-color behaviour
" with <Leader>;. SneakNext is used instead of ; because of vim-sneak plugin.
" (It forwards to ; where necessary)
nnoremap ; :
vnoremap ; :
nmap <Leader>;         <Plug>SneakNext
nmap <Leader><Leader>; <Plug>SneakPrevious

" Swap visual and visual block modes. Visual block more commonly used by me
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

" Common substitution patterns, accessible with one button press (on a Mac
" keyboard, at least)
nmap § :%s//g<LEFT><LEFT>
vmap § :s//g<LEFT><LEFT>

nnoremap zs :set spell!<CR>

" %% in command line maps to current file's directory
cnoremap %% <C-R>=expand('%:h').'/'<CR>
" %p in command line maps to current file's path
cnoremap %p <C-R>=expand('%:p')<CR>

" Shift+arrow key to change size of current pane
if bufwinnr(1)
  map <S-down> <C-W>+
  map <S-up> <C-W>-
  map <S-left> <C-W><
  map <S-right> <C-W>>
endif

nnoremap <Leader>hl :set hlsearch!<CR>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap <Leader><Leader>w :wq<CR>
nnoremap <Leader><Leader>q :wq<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wa<CR>

" Tab creation & movement
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>gt :execute 'tabmove +'.v:count1<CR>
nnoremap <Leader>gT :execute 'tabmove -'.v:count1<CR>
