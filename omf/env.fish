set -x SHELL (which fish)

set -x fish_user_paths \
    ~/.config/meta/bin \
    ~/.fzf/bin \
    ~/.local/bin \
    ./bin \
    ./node_modules/.bin

set -x ABDUCO_CMD nvim
alias abduco "abduco -e '^z'"
if [ "$NVIM_LISTEN_ADDRESS" ]
  set -x EDITOR nvr --remote-tab-wait
else
  set -x EDITOR abduco -A nvim-\(random\) nvim
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

set -x FD_DEFAULT_FLAGS '--exclude node_modules --exclude .git --exclude elm-stuff --exclude bower_components --no-ignore-vcs --hidden'
set -x RIPGREP_CONFIG_PATH $HOME/.config/ripgreprc
set -x FZF_DEFAULT_COMMAND "fd --type file $FD_DEFAULT_FLAGS"

# Set up go
set -x GOPATH ~/.local/share/go
set -x fish_user_paths $GOPATH/bin $fish_user_paths

[ -f ~/.config/omf/secrets.fish ]; and source ~/.config/omf/secrets.fish

set workspace ~/workspace
set projectsDir ~/.local/share/projects
