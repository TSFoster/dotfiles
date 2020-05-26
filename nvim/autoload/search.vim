function s:search_command(str, type, ...)
  let open_command = 'start'
  if has('mac')
    let open_command = 'open'
  elseif has('unix')
    let open_command = 'xdg-open'
  endif

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

  call system(open_command .. ' "' .. a:str .. @@ .. '"')

  let &selection = sel_save
  let @@ = reg_save
endfunction

function search#DuckDuckGo(...)
  call function('s:search_command', ['https://duckduckgo.com/?q='] + a:000)()
endfunction

function search#Github(...)
  call function('s:search_command', ['https://github.com/'] + a:000)()
endfunction

function search#Dict(...)
  call function('s:search_command', ['http://dictionary.reference.com/browse/'] + a:000)()
endfunction

function search#CanIUse(...)
  call function('s:search_command', ['https://caniuse.com/#search='] + a:000)()
endfunction

function search#Wikipedia(...)
  call function('s:search_command', ['http://en.wikipedia.org/wiki/Special:Search?search='] + a:000)()
endfunction
