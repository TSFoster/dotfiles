fish_vi_key_bindings

set -g fish_dotfiles ~/.dotfiles/fish
set -x fish_function_path $fish_dotfiles/functions $fish_function_path

source $fish_dotfiles/env.fish

for file in $fish_dotfiles/aliases/*.fish
    source $file
end

if status --is-interactive
    source $fish_dotfiles/colors.fish
end
