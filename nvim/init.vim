let g:plugins = []
function! Plugin(...)
  let opts = {}
  let post = v:null
  if a:0 > 1
    if type(a:2) == type("")
      let post = a:2
    elseif type(a:2) == type({})
      let opts = a:2
      if a:0 > 2 && type(a:3) == type("")
        let post = a:3
      endif
    endif
  endif
  let g:plugins += [[a:1, opts, post]]
endfunction
command! -nargs=+ Plugin call Plugin(<args>)


command! -nargs=1 Source source ~/.config/nvim/<args>.vim

Source general
Source dragvisuals
Source sessions
Source snippets
Source statusbar
Source titlebar
Source colors
Source files
Source history
Source textobjects
Source finding
Source mappings
Source git
Source fuzzy
Source clipboard
Source dispatching
Source meta
Source search
Source languages
Source panes
Source whitespace
Source italics
Source comments

delcommand Source


call plug#begin('~/.local/share/nvim/plugged')
for plugin in g:plugins
  Plug plugin[0], plugin[1]
endfor
call plug#end()
for plugin in g:plugins
  if type(plugin[2]) == type("")
    call eval(plugin[2])
  endif
endfor

delfunction Plugin
delcommand Plugin
unlet g:plugins
