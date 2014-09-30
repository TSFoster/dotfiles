VIM_CRONTAB=true
DOTDIR=$HOME/.dotfiles/zsh
GOPATH=$HOME/.gocode
EDITOR=vim
PAGER="/bin/sh -c \"unset PAGER;col -b -x | vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' -c 'map <SPACE> <C-D>' -c 'map b <C-U>' -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

HISTSIZE=1000
HISTFILE=~/.history
SAVEHIST=1000

RUBY_CONFIGURE_OPTS="--enable-shared"
PYTHON_CONFIGURE_OPTS="--enable-shared"

OS='Unknown'
if uname | grep -q 'Darwin'; then
  OS='Mac'
fi
