Plugin 'dense-analysis/ale'
let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_linters = {}
let g:ale_lint_delay = 2000

function! ToggleFixOnSave()
  if !exists('b:ale_fix_on_save')
    let b:ale_fix_on_save=g:ale_fix_on_save
  endif
  let b:ale_fix_on_save=!b:ale_fix_on_save
  if b:ale_fix_on_save
    echom 'Fix on save'
  else
    echom 'Don’t fix on save'
  endif
endfunction

nnoremap <silent> yof :call ToggleFixOnSave()<CR>

" vim: tabstop=2 softtabstop=2 shiftwidth=2
