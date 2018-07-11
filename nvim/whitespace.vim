Plugin 'editorconfig/editorconfig-vim'
Plugin 'tommcdo/vim-lion'
Plugin 'tpope/vim-sleuth'

let g:lion_squeeze_spaces = 1

set listchars=tab:▸\ ,trail:· " Show trailing tabs and spaces
set list                      " Display whitespace
set breakindent               " Visually indent wrapped lines to match whitespace

" Set all the tab stops to the same value
function! SetTab(tabstop)
  if a:tabstop > 0
    let &l:softtabstop = a:tabstop
    let &l:tabstop = a:tabstop
    let &l:shiftwidth = a:tabstop
  endif
endfunction

set expandtab

" Quick way to change tab stops. Add bang to reformat file
command! -bang -nargs=1 Stab call SetTab(<f-args>) | call Preserve(<bang>0 ? 'normal gg=G' : '')

" Quick way to switch between tabs and spaces
command! Tabs set noexpandtab
command! Spaces set expandtab

" Insert whitespace in normal mode
augroup whitespace
  autocmd!
  autocmd VimEnter,BufReadPost *
        \ if &modifiable
        \ | nnoremap <buffer> <CR> i<CR><Esc>
        \ | nnoremap <buffer> \| i<Space><Esc>
        \ | endif
augroup END

" vim: tabstop=2 softtabstop=2 shiftwidth=2
