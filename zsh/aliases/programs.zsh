alias wcat='wget -q -O -'

alias v='vim'
alias vi='vim'
function vs {
  local sessionroot="$(git root 2>/dev/null)"
  local session=''

  if [ -z "$sessionroot" ]; then sessionroot='.'; fi

  if [ -s "$sessionroot/Session.vim" ]; then
    session="$sessionroot/Session.vim"
  elif [ -s "$sessionroot/.Session.vim" ]; then
    session="$sessionroot/.Session.vim"
  fi

  if [ -n "$session" ]; then
    vim -S $session
  else
    vim +"Obsession $sessionroot/Session.vim"
  fi
}

alias tm='tmux'
alias tma='tmux attach'

alias psg='pgrep -fil'

alias r='rails'

alias m='meteor'

alias ql='qlmanage -p'

alias server='ruby -run -e httpd . -p5000' # One-line server (change port to X with -pX)

alias ctags_rails='ctags -R --languages=ruby --exclude=.git --exclude=log .'
alias ctags_rails_bundle='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'

function pvr { echo "search0 $*" > "$HOME/.get_iplayer/pvr/$*"; v "$HOME/.get_iplayer/pvr/$*" }
function pvr_radio { echo "type radio\nsearch0 $*" > "$HOME/.get_iplayer/pvr/$*"; v "$HOME/.get_iplayer/pvr/$*" }
