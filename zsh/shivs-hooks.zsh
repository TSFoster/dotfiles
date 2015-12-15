if exists direnv; then eval "$(direnv hook zsh)"; fi
if exists pyenv; then eval "$(pyenv init -)"; fi
if exists rbenv; then eval "$(rbenv init -)"; fi
export PATH
