set -l shell_path $fish_dotfiles/colors/base16-strange_harmony

switch (cat ~/.lightdark)
    case 'Dark'
        eval sh $shell_path.dark.sh
        set -e theme_color_scheme
        set -U theme_color_scheme terminal2-dark-white
    case '*'
        eval sh $shell_path.light.sh
        set -e theme_color_scheme
        set -U theme_color_scheme terminal2-light-white
end
