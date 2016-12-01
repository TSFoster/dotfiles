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
set hidden                     " Keep buffers of abandoned files, just hide them
set textwidth=0                " Don't auto-newline
set nrformats=bin,octal,hex   " Include chars and hex numbers in <C-a>,<C-x>

let g:netrw_home=$HOME        " Store network files in fixed location, not current directory
let g:netrw_preview      = 1  " Vertical preview
let g:netrw_liststyle    = 3  " Tree view (toggle with `i`)
let g:netrw_winsize      = 70 " Large windows sizes with `o` and `v`
let g:netrw_browse_split = 0  " Open in same window

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
