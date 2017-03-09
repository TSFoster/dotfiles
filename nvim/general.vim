Plugin 'tpope/vim-characterize'

if has('mouse')
  set mouse=a
endif

filetype plugin indent on

set exrc                                 " Enable per-directory .vimrc files
set secure                               " Disable unsafe commands in local .vimrc files

set termguicolors
set number
set numberwidth=4
set relativenumber

set ignorecase                 " Ignore case in search …
set smartcase                  " … unless it's a cap
set wildignorecase             " Ignore case on command line
set wildmode=longest,list,full " Tabs on command line
set wildmenu                   " Hints on command line
set hidden                     " Keep buffers of abandoned files, just hide them
set textwidth=0                " Don't auto-newline
set nrformats=bin,octal,hex    " Include chars and hex numbers in <C-a>,<C-x>

set foldlevelstart=20
autocmd BufReadPre * setlocal foldmethod=indent
autocmd BufReadPre * setlocal foldcolumn=4

set scrolloff=5

set formatprg=par\ rqw80j
let $PAGER=''             " Let vim be the pager

" Restore last cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


" Run a command and return cursor (and last search) to original position
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction


let g:python_host_prog = '/Users/toby/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/toby/.pyenv/versions/neovim3/bin/python'
