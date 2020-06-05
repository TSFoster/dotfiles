function viman --wraps=man --description 'Open manpage in new tab in nvim'
  set location (man -w $argv[1])
  and nvr +"tabe +Man\\ $location|only"
end
