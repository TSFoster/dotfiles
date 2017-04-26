fish_vi_key_bindings

set -g fish_dotfiles ~/.dotfiles/fish
set -x fish_function_path $fish_dotfiles/functions $fish_function_path
set -x fish_user_paths ~/bin ~/.fzf/bin
set -x EDITOR nvim

for file in $fish_dotfiles/aliases/*.fish
    source $file
end

if status --is-interactive
    source $fish_dotfiles/colors.fish
end
