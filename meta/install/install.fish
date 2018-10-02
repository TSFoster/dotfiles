cd (dirname (status filename))

source omf/env.fish

mkdir -p $configDir
mkdir -p $dataDir
mkdir -p $localBinDir
mkdir -p $workspaceDir
mkdir -p $projectsDir

if not command -s git > /dev/null
  echo '!!> You need to install git first!' >&2
  exit 1
end

[ -d $configDir ]
or git clone https://github.com/TSFoster/dotfiles.git $configDir

cd $configDir

[ (git remote get-url origin) = 'https://github.com/TSFoster/dotfiles.git' ]
and git remote set-url origin git@github.com:TSFoster/dotfiles.git

[ $OS = Mac ]
or echo '!!> This is not a Mac! Let’s see how well this goes…'

echo '--> Fish setup'
meta/install/fish

echo '--> Theme setup'
theme/setup

echo '--> CLI apps'
meta/install/cli

echo '--> Neovim'
meta/install/neovim

echo '--> Sounds'
meta/install/sounds

if [ -d /Applications/Hammerspoon.app ]
  echo '--> Hammerspoon'
  meta/install/hammerspoon
end

if [ $OS = Mac ]
  echo '--> Defaults'
  meta/install/defaults
end
