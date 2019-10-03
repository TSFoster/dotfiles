Plugin 'tpope/vim-characterize'

if has('mouse')
  set mouse=a
endif

set exrc   " Enable per-directory .vimrc files
set secure " Disable unsafe commands in local .vimrc files

set lazyredraw " Don't slow macros down by rendering every step

set termguicolors
set number
augroup numbering
  autocmd!
  autocmd TermOpen * set nonumber
augroup END
set relativenumber

set ignorecase                 " Ignore case in search …
set smartcase                  " … unless it's a cap
set wildignorecase             " Ignore case on command line
set wildmode=longest,list,full " Tabs on command line
set hidden                     " Keep buffers of abandoned files, just hide them
set textwidth=0                " Don't auto-newline

" Suggested settings for coc.nvim
set nowritebackup
set cmdheight=2
set updatetime=300
set signcolumn=yes
" Don’t give |ins-completion-message| messages.
set shortmess+=c

set scrolloff=5

set formatprg=par\ rqw80
let $PAGER=''             " Let vim be the pager


" Restore last cursor position
augroup cursor_position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END


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


let g:python_host_prog = substitute(system('which python2'),'\n','','g')
let g:python3_host_prog = substitute(system('which python3'),'\n','','g')

let g:netrw_home=$HOME.'/.local/share/nvim'

" vim: tabstop=2 softtabstop=2 shiftwidth=2
