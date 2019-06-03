set --export configDir $HOME/.config
set --export dataDir $HOME/.local/share
set --export localBinDir $HOME/.local/bin
set --export workspaceDir $HOME/workspace
set --export projectsDir $dataDir/projects

set --export fish_key_bindings fish_vi_key_bindings

set --export fish_user_paths \
    $configDir/meta/bin \
    $localBinDir \
    ~/.fzf/bin \
    ~/.cargo/bin \
    ./bin \
    ./node_modules/.bin

set --export SHELL (which fish)

set --export OS Unknown
uname | grep -q Darwin; and set --export OS Mac

# If nvim’s been installed, let’s assume nvr and abduco have been, too
if command -s nvim > /dev/null
  set --export ABDUCO_CMD nvim
  alias abduco "abduco -e '^z'"
  if [ "$NVIM_LISTEN_ADDRESS" ]
    set --export EDITOR nvr --remote-tab-wait
  else
    set --export EDITOR abduco -A nvim-\(random\) nvim
  end
else
  set --export EDITOR vim
end

if [ $OS = Mac ]
  set --export HOMEBREW_CASK_OPTS --appdir=/Applications
  # Put the airport command in PATH
  set --export fish_user_paths /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources $fish_user_paths
  set --export iCloudDir "$HOME/Library/Mobile Documents/com~apple~CloudDocs/"
end

set --export PAGER less

set --export FD_DEFAULT_FLAGS '--exclude node_modules --exclude .git --exclude elm-stuff --exclude bower_components --exclude target --no-ignore-vcs --hidden'
set --export RIPGREP_CONFIG_PATH $configDir/ripgreprc
set --export FZF_DEFAULT_COMMAND "fd --type file $FD_DEFAULT_FLAGS"

# Set up go
set --export GOPATH $dataDir/go
set --export fish_user_paths $GOPATH/bin $fish_user_paths

[ -f $configDir/omf/secrets.fish ]; and source $configDir/omf/secrets.fish
