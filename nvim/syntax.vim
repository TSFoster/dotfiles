Plugin 'sheerun/vim-polyglot'
Plugin 'ap/vim-css-color'
Plugin 'slashmili/alchemist.vim'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'tomtom/tcomment_vim'
Plugin 'ElmCast/elm-vim', { 'for': ['elm'] }
Plugin 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript'] }

let g:polyglot_disabled = []

" Folding {{{
set foldlevelstart=20
autocmd BufReadPre *     setlocal foldmethod=indent
autocmd BufReadPre *.vim setlocal foldmethod=marker
autocmd BufReadPre *     setlocal foldcolumn=4
" }}}


" Properly set filetype for odd file extensions
autocmd BufNewFile,BufRead *.rss        setfiletype xml
autocmd BufNewFile,BufRead *.zshrc      setfiletype zsh
autocmd BufNewFile,BufRead *.shrc       setfiletype sh
autocmd BufNewFile,BufRead *.zshenv     setfiletype zsh
autocmd BufNewFile,BufRead *.bashrc*    setfiletype bash
autocmd BufNewFile,BufRead *.vimrc*     setfiletype vim
autocmd BufNewFile,BufRead *.gitconfig* setfiletype gitconfig
autocmd BufNewFile,BufRead *.es6        setfiletype javascript

" Use italic fonts
highlight markdownItalic cterm=italic
highlight Comment        cterm=italic
autocmd ColorScheme * highlight markdownItalic cterm=italic
                  \ | highlight Comment        cterm=italic

" Whitespace {{{
set listchars=tab:▸\ ,trail:· " Show trailing tabs and spaces
set list                      " Display whitespace

" Default to 2 spaces
set expandtab
let &l:sts = 2
let &l:ts = 2
let &l:sw = 2

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
" }}}

" Elm {{{
let g:polyglot_disabled += ['elm']
let g:elm_setup_keybindings = 0
" }}}
