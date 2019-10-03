if has('mac')
  let s:open_command = 'open'
elseif has('unix')
  let s:open_command = 'xdg-open'
else
  let s:open_command = 'start'
endif


function! SearchCommand(str, type, ...)
  echom a:str
  echom '---'
  echom a:type
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0
    let @@ = a:1
  elseif a:type == 'visual'
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif

  call system(s:open_command.' "'.a:str.@@.'"')

  let &selection = sel_save
  let @@ = reg_save
endfunction

function! DuckDuckGo(...)
  call function('SearchCommand', ['https://duckduckgo.com/?q='] + a:000)()
endfunction
command! -nargs=+ DuckDuckGo call DuckDuckGo('', '<args>')<CR>
nmap <silent> <Leader>/. :set opfunc=DuckDuckGo<CR>g@
vmap <silent> <Leader>/. :<C-U>call DuckDuckGo('visual')<CR>

function! Github(...)
  call function('SearchCommand', ['https://www.github.com/'] + a:000)()
endfunction
command! -nargs=+ Github call Github('', '<args>')<CR>
nmap <silent> <Leader>/g :set opfunc=Github<CR>g@
vmap <silent> <Leader>/g :<C-U>call Github('visual')<CR>

function! Dict(...)
  call function('SearchCommand', ['http://dictionary.reference.com/browse/'] + a:000)()
endfunction
command! -nargs=+ Dict call Dict('', '<args>')<CR>
nmap <silent> <Leader>/d :set opfunc=Dict<CR>g@
vmap <silent> <Leader>/d :<C-U>call Dict('visual')<CR>

function! Wikipedia(...)
  call function('SearchCommand', ['http://en.wikipedia.org/wiki/Special:Search?search='] + a:000)()
endfunction
command! -nargs=+ Wikipedia call Wikipedia('', '<args>')<CR>
nmap <silent> <Leader>/w :set opfunc=Wikipedia<CR>g@
vmap <silent> <Leader>/w :<C-U>call Wikipedia('visual')<CR>


Plugin 'zoeesilcock/vim-caniuse'

if has('mac')
  Plugin 'rizzatti/dash.vim'
endif

function! Keywordprg(word)
  if CocHasProvider('hover')
    call CocAction('doHover')
  elseif count(['vim','help'], &filetype)
    execute 'h '.expand('<cword>')
  elseif count(['shell', 'sh', 'bash', 'zsh', 'fish'], &filetype)
    Man a:word
  else
    call system('search '.a:word)
  endif
endfunction

command! -nargs=+ Keywordprg call Keywordprg('<args>')<CR>

set keywordprg=:Keywordprg


" vim: tabstop=2 softtabstop=2 shiftwidth=2
