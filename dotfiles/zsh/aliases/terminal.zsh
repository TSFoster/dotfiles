alias please='sudo'
alias words='cat /usr/share/dict/words'

alias s='source $HOME/.zshenv && source $HOME/.zshrc'

alias -g G='|& egrep -i'
alias -g V='| vim -'
alias -g §='| vipe |'
alias -g P='| eval $PAGER'

if [ "$OS" = Mac ]; then
  alias -g N='; terminal-notifier -message "Command finished"'
fi
