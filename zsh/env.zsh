VIM_CRONTAB=true
DOTDIR=$HOME/.dotfiles/zsh
export GOPATH=$HOME/.gocode

if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  export EDITOR=edit_and_wait
else
  export EDITOR=nvim
fi

HISTSIZE=1000
HISTFILE=~/.history
SAVEHIST=1000

OS='Unknown'
if uname | grep -q 'Darwin'; then
  OS='Mac'
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
fi

export PAGER=less
