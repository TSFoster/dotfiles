call plug#begin('~/.config/nvim/plugged')

for plugin in g:plugins
  Plug plugin[0], plugin[1]
endfor

call plug#end()

if exists("*Plugin")
  delfunction Plugin
endif
if exists(":Plugin")
  delcommand Plugin
endif
