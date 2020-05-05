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
Source completion
Source formatting
Source tags
Source languages
Source panes
Source whitespace
Source italics
Source comments

delcommand Source

delfunction Plugin
delcommand Plugin


call plug#begin('~/.local/share/nvim/plugged')
for plugin in g:plugins
  Plug plugin[0], plugin[1]
endfor
call plug#end()
unlet g:plugins

" vim: tabstop=2 softtabstop=2 shiftwidth=2
