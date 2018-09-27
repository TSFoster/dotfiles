set -x configDir $HOME/.config
set -x dataDir $HOME/.local/share
set -x localBinDir $HOME/.local/bin
set -x workspaceDir $HOME/workspace
set -x projectsDir $dataDir/projects

set -x fish_user_paths \
    $configDir/meta/bin \
    $localBinDir \
    ~/.fzf/bin \
    ./bin \
    ./node_modules/.bin

set -x SHELL (which fish)
set -x OS (os_name)

# If nvim’s been installed, let’s assume nvr and abduco have been, too
if command -s nvim > /dev/null
  set -x ABDUCO_CMD nvim
  alias abduco "abduco -e '^z'"
  if [ "$NVIM_LISTEN_ADDRESS" ]
    set -x EDITOR nvr --remote-tab-wait
  else
    set -x EDITOR abduco -A nvim-\(random\) nvim
  end
else
  set -x EDITOR vim
end

if [ $OS = Mac ]
  set -x HOMEBREW_CASK_OPTS --appdir=/Applications
  # Put the airport command in PATH
  set -x fish_user_paths /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources $fish_user_paths
  set -x iCloudDir "$HOME/Library/Mobile Documents/com~apple~CloudDocs/"
end

set -x PAGER less

set -x FD_DEFAULT_FLAGS '--exclude node_modules --exclude .git --exclude elm-stuff --exclude bower_components --no-ignore-vcs --hidden'
set -x RIPGREP_CONFIG_PATH $configDir/ripgreprc
set -x FZF_DEFAULT_COMMAND "fd --type file $FD_DEFAULT_FLAGS"

# Set up go
set -x GOPATH $dataDir/go
set -x fish_user_paths $GOPATH/bin $fish_user_paths

[ -f $configDir/omf/secrets.fish ]; and source $configDir/omf/secrets.fish
