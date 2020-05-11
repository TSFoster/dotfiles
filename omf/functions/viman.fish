function viman --description 'Open manpage in new tab in nvim'
  man -w $argv[1] > /dev/null
  and nvr +'tabe +Man\\ '$argv[1]'|only'
end
