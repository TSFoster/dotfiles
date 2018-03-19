Plugin 'Shougo/neoinclude.vim'

Plugin 'Shougo/echodoc.vim'
let g:echodoc_enable_at_startup = 1

Plugin 'roxma/nvim-completion-manager'

set shortmess+=c

" Actually enter when enter's hit…
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
" …unless it's a snippet
imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-K>":"\<CR>")
" Use tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Plugin 'eagletmt/neco-ghc'
" Plugin 'landaire/deoplete-swift'

" vim: tabstop=2 softtabstop=2 shiftwidth=2
