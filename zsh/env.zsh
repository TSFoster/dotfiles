VIM_CRONTAB=true
DOTDIR=$HOME/.dotfiles/zsh
export GOPATH=$HOME/.gocode
export EDITOR=vim

HISTSIZE=1000
HISTFILE=~/.history
SAVEHIST=1000

OS='Unknown'
if uname | grep -q 'Darwin'; then
  OS='Mac'
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
fi
