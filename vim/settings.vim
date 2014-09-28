if has('mouse')
  set mouse=a
  set ttymouse=xterm2
endif

" Settle for best available indent etc
if has("autocmd")
  filetype plugin indent on
else
  set autoindent
endif

let g:netrw_home=$HOME                   " Store network files in fixed location, not current directory
set dir=~/.vimswap//,/var/tmp//,/tmp//,. " Store swap files in fixed location, not current directory
set undofile                             " Store undos in a file
set undodir=~/.vimundo                   " Store undo files in fixed location, not current directory
set undolevels=1000                      " Maximum number of changes that can be undone
set undoreload=10000                     " Maximum number lines to save for undo on a buffer reload
set viminfo='1000,f1,<500                " Keep marks for 1000 files, store global marks, limit viminfo to 500 lines
set exrc                                 " Enable per-directory .vimrc files
set secure                               " Disable unsafe commands in local .vimrc files

set ignorecase                 " Ignore case in search …
set smartcase                  " … unless it's a cap
set wildignorecase             " Ignore case on command line
set hidden                     " Keep buffers of abandoned files, just hide them
set ttyfast                    " Smoother redrawing for modern machine …
set lazyredraw                 " … but don't bother redrawing stuff you don't need to
set backspace=indent,eol,start " More useful backspace
set textwidth=0                " Don't auto-newline
set nrformats=alpha,hex        " Include chars and hex numbers in <C-a>,<C-x>

set scrolloff=5

set cryptmethod=blowfish

set nohlsearch
set incsearch

set formatprg=par\ rqw80j
set shell=zsh\ -l
let $PAGER=''             " Let vim be the pager

" Restore last cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
