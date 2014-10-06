if has('mac')
  let s:open_command = 'open'
elseif has('unix')
  let s:open_command = 'xdg-open'
else
  let s:open_command = 'start'
endif

command! -nargs=+ Google call system(s:open_command.' "https://www.google.com/search?q=<args>"')
nmap <Leader>/g :Google 
vmap <Leader>/g "zy:Google <C-r>z<CR>

command! -nargs=+ Github call system(s:open_command.' "https://www.github.com/<args>"')
nmap <Leader>/G :Github 
vmap <Leader>/G "zy:Github <C-r>z<CR>

command! -nargs=+ Dict call system(s:open_command.' "http://dictionary.reference.com/browse/<args>"')
nmap <Leader>/d :Dict 
vmap <Leader>/d "zy:Dict <C-r>z<CR>

command! -nargs=+ Wikipedia call system(s:open_command.' "http://en.wikipedia.org/wiki/Special:Search?search=<args>"')
nmap <Leader>/w :Wikipedia 
vmap <Leader>/w "zy:Wikipedia <C-r>z<CR>

command! -nargs=+ Open call system(s:open_command.' "<args>"')
nmap <Leader>// :Open 
vmap <Leader>// "zy:Open <C-r>z<CR>

nmap <Leader>/c :CanIUse 
nmap <Leader>/C :CanIUse<CR>
vmap <Leader>/c "zy:CanIUse <C-r>z<CR>
