nnoremap <silent> <Leader>d :CocList files --type=directory<CR>
nnoremap <silent> <Leader>D :CocList files %:p:h --type=directory<CR>
nnoremap <silent> <Leader>e :CocList files --type=file<CR>
nnoremap <silent> <Leader>E :CocList files %:p:h --type=file<CR>
nnoremap <silent> <Leader>h: :CocList cmdhistory<CR>
nnoremap <silent> <Leader>h/ :CocList searchhistory<CR>
nnoremap <silent> <Leader>mr :CocList mru<CR>
nnoremap <silent> <Leader>he :CocList helptags<CR>
nnoremap <silent> <Leader>ta :CocList tags<CR>
nnoremap <silent> <Leader>b :CocList buffers<CR>
nnoremap <silent> <Leader>B :CocList lines<CR>

function! CreateFile(path)
  if type(a:path) == v:t_dict
    if a:path["name"] == "files"
      call CreateFile(a:path["targets"])
    else
      return
    end
  elseif type(a:path) == v:t_list
    for i in a:path
      call CreateFile(i.location.uri)
    endfor
  else
    let filename = input('Enter filename: ')
    let fullpath = fnamemodify(a:path, ':p:h') . '/' . filename
    execute "normal \<Esc>:edit " . fullpath . "\<CR>"
  endif
endfunction

function! PopulateArgs(ctx)
  let paths = map(a:ctx["targets"], 'v:val["location"]["uri"]')
  execute "normal \<Esc>:args " . join(paths, ' ') . "\<CR>"
endfunction


if executable('rg')
  set grepprg=rg\ --vimgrep
endif
nnoremap <Leader>a :silent! grep<Space>
nnoremap <Leader>A :silent! grepadd<Space>
nnoremap <Leader><Leader>a :silent! lgrep<Space>
nnoremap <Leader><Leader>A :silent! lgrepadd<Space>

" vim: tabstop=2 softtabstop=2 shiftwidth=2
