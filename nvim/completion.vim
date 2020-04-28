Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <A-TAB> coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <CR> to confirm completion, <C-g>u means break undo chain at current position.
inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <Leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <silent> <Leader>f  <Plug>(coc-format-selected)
nmap <silent> <Leader>f  <Plug>(coc-format)

augroup cocnvim
  autocmd!
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Setup formatexpr specified filetype(s).
  autocmd FileType * call <SID>setup_formatexpr()
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

function s:setup_formatexpr()
  if exists('*CocHasProvider') && CocHasProvider('format')
    setlocal formatexpr=CocAction('formatSelected')
  endif
endfunction

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <Leader>a  <Plug>(coc-codeaction-selected)
" nmap <Leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <Leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <Leader>cf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)


Plugin 'honza/vim-snippets'

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


" vim: tabstop=2 softtabstop=2 shiftwidth=2
