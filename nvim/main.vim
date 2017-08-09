command! -nargs=1 Source source ~/.dotfiles/nvim/<args>.vim

let g:plugins = []
function! Plugin(...)
  let opts = {}
  if (a:0 > 1)
    let opts = a:2
  endif
  let g:plugins += [[a:1, opts]]
endfunction
command! -nargs=+ Plugin call Plugin(<args>)

Source general
Source dragvisuals
Source sessions
Source snippets
Source statusbar
Source colors
Source files
Source history
Source textobjects
Source finding
Source mappings
Source git
Source fuzzy
Source tmux
Source clipboard
Source dispatching
Source meta
Source search
Source languages
Source whitespace
Source italics
Source comments

" TODO: Move to k-takata/minpac?
call plug#begin('~/.local/share/nvim/plugged')
for plugin in g:plugins
  Plug plugin[0], plugin[1]
endfor
call plug#end()

delfunction Plugin
delcommand Plugin
unlet g:plugins


delcommand Source
