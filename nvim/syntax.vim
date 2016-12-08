Plugin 'sheerun/vim-polyglot'
Plugin 'ap/vim-css-color'
Plugin 'slashmili/alchemist.vim'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'tomtom/tcomment_vim'
Plugin 'ElmCast/elm-vim', { 'for': ['elm'] }
Plugin 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript'] }

let g:polyglot_disabled = ['cryptol']

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


" Set all the tab stops to the same value
function! SetTab(tabstop)
  if a:tabstop > 0
    let &l:softtabstop = a:tabstop
    let &l:tabstop = a:tabstop
    let &l:shiftwidth = a:tabstop
  endif
endfunction

call SetTab(2)
set expandtab
set smarttab

" Quick way to change tab stops. Add bang to reformat file
command! -bang -nargs=1 Stab call SetTab(<f-args>) | call Preserve(<bang>0 ? 'normal gg=G' : '')

" Quick way to switch between tabs and spaces
command! Tabs set noexpandtab
command! Spaces set expandtab
" }}}

" Elm {{{
let g:polyglot_disabled += ['elm']
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1
" }}}
