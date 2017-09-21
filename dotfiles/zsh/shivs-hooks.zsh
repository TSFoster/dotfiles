if exists direnv; then eval "$(direnv hook zsh)"; fi
if exists pyenv; then eval "$(pyenv init -)"; fi
if exists rbenv; then eval "$(rbenv init -)"; fi
if exists swiftenv; then eval "$(swiftenv init -)"; fi
export PATH
