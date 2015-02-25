function path_if_exists {
  if [ -d "$1" ]; then
    PATH=$1:$PATH
  fi
}

path_if_exists /usr/local/git/bin
path_if_exists /usr/local/pear/bin
path_if_exists /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources
path_if_exists $GOPATH/bin
path_if_exists /usr/local/sbin
path_if_exists /opt/local/bin
path_if_exists /opt/local/sbin
path_if_exists /usr/local/bin
path_if_exists /usr/local/heroku/bin
path_if_exists $HOME/.pyenv/shims
path_if_exists $HOME/.rbenv/shims
path_if_exists $HOME/.dotfiles/bin
path_if_exists $HOME/.cabal/bin

unset -f path_if_exists
