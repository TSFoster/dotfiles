if not command -s git > /dev/null
  echo '!!> You need to install git first!' >&2
  exit 1
end

set dotfilesDir $HOME/.config

if [ -d $dotfilesDir ]
  if not [ -d $dotfilesDir/.git ]; or not string match --quiet --regex 'TSFoster/dotfiles' (cd $dotfilesDir; git remote get-url origin)
    read --prompt-str='!!> Delete .config and start again (y/n)? ' --nchars=1 deleteConfig
    if [ $deleteConfig = y ]
      rm -rf $dotfilesDir
    else
      echo '!!> Aborting' >&2
      exit 1
    end
  end
end

[ -d $dotfilesDir ]
or git clone https://github.com/TSFoster/dotfiles.git $dotfilesDir
cd $dotfilesDir

[ (git remote get-url origin) = 'https://github.com/TSFoster/dotfiles.git' ]
and git remote set-url origin git@github.com:TSFoster/dotfiles.git

source omf/env.fish

mkdir -p $dataDir
mkdir -p $localBinDir
mkdir -p $workspaceDir
mkdir -p $projectsDir

[ $OS = Mac ]
or echo '!!> This is not a Mac! Let’s see how well this goes…'

echo '--> Fish setup'
./meta/install/fish

echo '--> Theme setup'
./theme/setup

echo '--> CLI apps'
./meta/install/cli

echo '--> Neovim'
./meta/install/neovim

echo '--> Sounds'
./meta/install/sounds

if [ -d /Applications/Hammerspoon.app ]
  echo '--> Hammerspoon'
  ./meta/install/hammerspoon
end

if [ $OS = Mac ]
  echo '--> Defaults'
  ./meta/install/defaults
end
