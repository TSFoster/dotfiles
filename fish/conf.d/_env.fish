# TODO is it worth making most of these universal, set in a secript in meta/install/fish?

set --export XDG_CONFIG_HOME $HOME/.config
set --export XDG_DATA_HOME $HOME/.local/share
set --global config $XDG_CONFIG_HOME
set --global data $HOME/.local/share
set --global localBin $HOME/.local/bin
set --global workspace $HOME/workspace

# Set up go
set --export GOPATH $XDG_DATA_HOME/go

set --export fish_user_paths \
  /usr/local/bin \
  /usr/local/sbin \
  $config/meta/bin \
  $localBin \
  ~/.cargo/bin \
  ./bin \
  ./node_modules/.bin \
  $GOPATH/bin

set --export fish_key_bindings fish_vi_key_bindings

for dir in \
    /usr/local/opt/node@10/bin \
    $HOME/.fzf/bin \
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources \
    $HOME/Library/Python/3.7/bin \
    /Applications/Plex\ Media\ Server.app/Contents/MacOS
  test -d $dir
  and set --export fish_user_paths $fish_user_paths $dir
end


if not set --query OS
  set --universal OS Unknown
  uname | grep -q Darwin; and set --universal OS Mac
end

set --export PAGER less

# If nvim’s been installed, let’s assume nvr and abduco have been, too
if command -s nvim > /dev/null
  set --export VIMPACK_BUNDLE main
  set --export ABDUCO_CMD nvim
  if [ "$NVIM_LISTEN_ADDRESS" ]
    set --export EDITOR nvr --remote-tab-wait
    set --export PAGER nvr '\'+call buffer#init_pager()\'' --remote-wait -
  else
    set --export EDITOR abduco -A nvim-\(random\) nvim
  end
else
  set --export EDITOR vim
end

if [ $OS = Mac ]
  set --export HOMEBREW_CASK_OPTS --appdir=/Applications
  set --export iCloud "$HOME/Library/Mobile Documents/com~apple~CloudDocs/"
  set --export documents "$iCloud/Documents"
  set --export work "$documents/Work"
  set --export clients "$work/Clients"
end

set --export FD_DEFAULT_FLAGS '--exclude node_modules --exclude .git --exclude elm-stuff --exclude bower_components --exclude target --exclude .DS_Store --exclude .sass-cache --no-ignore-vcs --hidden'
set --export RIPGREP_CONFIG_PATH $config/ripgreprc
set --export FZF_DEFAULT_COMMAND "fd --type file $FD_DEFAULT_FLAGS"

# Set up Java
set --export JAVA_HOME (/usr/libexec/java_home)
