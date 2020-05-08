function coc#custom_actions#create_file(path)
  if type(a:path) == v:t_dict
    if a:path["name"] == "files"
      call coc#custom_actions#create_file(a:path["targets"])
    else
      return
    end
  elseif type(a:path) == v:t_list
    for i in a:path
      call coc#custom_actions#create_file(i.location.uri)
    endfor
  else
    let filename = input('Enter filename: ')
    let fullpath = fnamemodify(a:path, ':p:h') . '/' . filename
    execute "normal \<Esc>:edit " . fullpath . "\<CR>"
  endif
endfunction

function! coc#custom_actions#populate_args(ctx)
  let paths = map(a:ctx["targets"], 'v:val["location"]["uri"]')
  execute "normal \<Esc>:args " . join(paths, ' ') . "\<CR>"
endfunction
