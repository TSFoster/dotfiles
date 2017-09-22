set -x SHELL (which fish)

set -x GOPATH ~/.gocode

set -x fish_user_paths \
    ~/bin \
    ~/.config/meta/bin \
    $GOPATH/bin \
    ~/.composer/vendor/bin \
    /usr/local/pear/bin \
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources \
    /usr/local/sbin \
    /usr/local/heroku/bin \
    ~/.yarn/bin \
    ~/.fzf/bin \


if [ -z $NVIM_LISTEN_ADDRESS ]
  set -x EDITOR nvim
else
  set -x EDITOR edit_and_wait
end

if uname | grep -q 'Darwin'
  set -x OS Mac
  set -x HOMEBREW_CASK_OPTS --appdir=/Applications
else
  set -x OS Unknown
end

set -x PAGER less

set -x FZF_DEFAULT_COMMAND "ag --hidden --ignore .git --ignore elm-stuff --ignore node_modules --ignore bower_components -g ''"

if [ -f ~/.machine-private.fish ]
    source ~/.machine-private.fish
end
