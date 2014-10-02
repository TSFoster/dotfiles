if has('mac')
  let s:open_command = 'open'
elseif has('unix')
  let s:open_command = 'xdg-open'
else
  let s:open_command = 'start'
endif

command! -nargs=+ Google call system(s:open_command.' "https://www.google.com/search?q=<args>"')
nmap <Space>/g :Google 
vmap <Space>/g "zy:Google <C-r>z<CR>

command! -nargs=+ Github call system(s:open_command.' "https://www.github.com/<args>"')
nmap <Space>/G :Github 
vmap <Space>/G "zy:Github <C-r>z<CR>

command! -nargs=+ Dict call system(s:open_command.' "http://dictionary.reference.com/browse/<args>"')
nmap <Space>/d :Dict 
vmap <Space>/d "zy:Dict <C-r>z<CR>

command! -nargs=+ Wikipedia call system(s:open_command.' "http://en.wikipedia.org/wiki/Special:Search?search=<args>"')
nmap <Space>/w :Wikipedia 
vmap <Space>/w "zy:Wikipedia <C-r>z<CR>

command! -nargs=+ Open call system(s:open_command.' "<args>"')
nmap <Space>// :Open 
vmap <Space>// "zy:Open <C-r>z<CR>
