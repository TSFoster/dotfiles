set -x SHELL (which fish)

set -x fish_user_paths \
    ~/.config/meta/bin \
    ~/.fzf/bin \
    ~/.local/bin \

alias abduco "abduco -e '^z'"
if [ "$NVIM_LISTEN_ADDRESS" ]
  set -x EDITOR nvr --remote-tab-wait
else
  set -x EDITOR abduco -A nvim nvim
end

if uname | grep -q 'Darwin'
  set -x OS Mac
  set -x HOMEBREW_CASK_OPTS --appdir=/Applications
  set -x fish_user_paths /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources $fish_user_paths
  set -x ICLOUD "$HOME/Library/Mobile Documents/com~apple~CloudDocs/"
else
  set -x OS Unknown
end

set -x PAGER less

set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden --follow -g "!{.git,node_modules,bower_components,elm-stuff}/*" ^ /dev/null'

if [ -f ~/.machine-private.fish ]
    source ~/.machine-private.fish
end
