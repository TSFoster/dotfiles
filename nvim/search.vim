if has('mac')
  let s:open_command = 'open'
elseif has('unix')
  let s:open_command = 'xdg-open'
else
  let s:open_command = 'start'
endif

command! -nargs=+ DuckDuckGo call system(s:open_command.' "https://duckduckgo.com/?q=<args>"')
nmap <Leader>/. :DuckDuckGo 
vmap <silent> <Leader>/. "zy:DuckDuckGo <C-r>z<CR>

command! -nargs=+ Github call system(s:open_command.' "https://www.github.com/<args>"')
nmap <Leader>/g :Github 
vmap <silent> <Leader>/g "zy:Github <C-r>z<CR>

command! -nargs=+ Dict call system(s:open_command.' "http://dictionary.reference.com/browse/<args>"')
nmap <Leader>/d :Dict 
vmap <silent> <Leader>/d "zy:Dict <C-r>z<CR>

command! -nargs=+ Wikipedia call system(s:open_command.' "http://en.wikipedia.org/wiki/Special:Search?search=<args>"')
nmap <Leader>/w :Wikipedia 
vmap <silent> <Leader>/w "zy:Wikipedia <C-r>z<CR>

command! -nargs=+ Open call system(s:open_command.' "<args>"')
nmap <Leader>// :Open 
vmap <silent> <Leader>// "zy:Open <C-r>z<CR>


Plugin 'zoeesilcock/vim-caniuse'
let g:caniuse_no_mappings = 1

nmap <Leader>/c :CanIUse 
nmap <silent> <Leader>/C :CanIUse<CR>
vmap <silent> <Leader>/c "zy:CanIUse <C-r>z<CR>

if has('mac')
  Plugin 'rizzatti/dash.vim'
endif

" vim: tabstop=2 softtabstop=2 shiftwidth=2
