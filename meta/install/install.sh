OS='Unknown'
uname | grep -q 'Darwin' && OS='Mac'

# Helper functions
# Check if given command is executable
exists () { type "$1" >/dev/null 2>/dev/null; }

if [ "$OS" = 'Mac' ]; then 
  if ! exists brew; then
    echo "--> Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  if ! exists fish; then
    echo "--> Installing fish"
    brew install fish
  fi
fi

if ! exists fish; then
  echo '!!> You need to install fish first!' >&2
  exit 1
fi

curl -fsSL https://raw.githubusercontent.com/TSFoster/dotfiles/master/meta/install/install.fish | fish
