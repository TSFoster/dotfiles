syntax on
filetype on

set listchars=tab:▸\ ,trail:· " Show trailing tabs and spaces
set list                      " Display whitespace

" Default to 2 spaces
set expandtab
let &l:sts = 2
let &l:ts = 2
let &l:sw = 2

" Use italic fonts
highlight markdownItalic cterm=italic
highlight Comment        cterm=italic
autocmd ColorScheme * highlight markdownItalic cterm=italic
                  \ | highlight Comment        cterm=italic

function! SummariseTabs()
  try
    echohl ModeMsg
    echon 'Tabstop: '.&l:ts
    echon '; Shiftwidth: '.&l:sw
    echon '; Softtabstop: '.&l:sts
    if &l:et
      echon '; SPACES'
    else
      echon '; TABS'
    endif
  finally
    echohl None
  endtry
endfunction
nnoremap <Leader><Tab> :call SummariseTabs()<CR>

" Set all the tab stops to the same value
function! SetTab(tabstop)
  if a:tabstop > 0
    let &l:sts = a:tabstop
    let &l:ts = a:tabstop
    let &l:sw = a:tabstop
  endif
endfunction
" Quick way to change tab stops. Add another b to Stab to reformat file
command! -nargs=1 Stab  call SetTab(<f-args>)
command! -nargs=1 Stabb call SetTab(<f-args>) | normal gg=G
" Quick way to switch between tabs and spaces
command! Tabs set noexpandtab
command! Spaces set expandtab

" Properly set filetype for odd file extensions
autocmd BufNewFile,BufRead *.rss        setfiletype xml
autocmd BufNewFile,BufRead *.zshrc      setfiletype zsh
autocmd BufNewFile,BufRead *.shrc       setfiletype sh
autocmd BufNewFile,BufRead *.zshenv     setfiletype zsh
autocmd BufNewFile,BufRead *.bashrc*    setfiletype bash
autocmd BufNewFile,BufRead *.vimrc*     setfiletype vim
autocmd BufNewFile,BufRead *.gitconfig* setfiletype gitconfig

" crontab compatibility
if $VIM_CRONTAB == "true"
  set nobackup
  set nowritebackup
endif

" These files have strict tabs/spaces rules
autocmd FileType *    setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Folding
set foldlevelstart=20
autocmd BufReadPre *     setlocal foldmethod=indent
autocmd BufReadPre *.vim setlocal foldmethod=marker
autocmd BufReadPre *     setlocal foldcolumn=4

" Format whole file
nnoremap _$ :call Preserve("%s/\\s\\+$//e")<CR>:%v/^.\+$/normal S <C-v><C-h><C-v><Esc><CR>
nnoremap _= :call Preserve("normal gg=G")<CR>_$
