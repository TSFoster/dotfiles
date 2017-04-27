set -e theme_color_scheme
set -U theme_color_scheme user
set -l base00 f7f9fb
set -l base01 e5ebf1
set -l base02 cbd6e2
set -l base03 aabcce
set -l base04 627e99
set -l base05 405c79
set -l base06 223b54
set -l base07 0b1c2c
set -l base08 bf8b56
set -l base09 bfbf56
set -l base0A 8bbf56
set -l base0B 56bf8b
set -l base0C 568bbf
set -l base0D 8b56bf
set -l base0E bf568b
set -l base0F bf5656

switch (cat ~/.lightdark)
    case 'Dark'
        eval sh $HOME/.config/base16-shell/scripts/base16-harmonic-dark.sh

        set -l colorfg $base00

        set -U __color_initial_segment_exit     $base02 $base08 --bold
        set -U __color_initial_segment_su       $base02 $base0B --bold
        set -U __color_initial_segment_jobs     $base02 $base0D --bold

        set -U __color_path                     $base06 $base02
        set -U __color_path_basename            $base06 $base01 --bold
        set -U __color_path_nowrite             $base06 $base08
        set -U __color_path_nowrite_basename    $base06 $base08 --bold

        set -U __color_repo                     $base0B $colorfg
        set -U __color_repo_work_tree           $base06 $colorfg --bold
        set -U __color_repo_dirty               $base08 $colorfg
        set -U __color_repo_staged              $base09 $colorfg

        set -U __color_vi_mode_default          $base04 $colorfg --bold
        set -U __color_vi_mode_insert           $base0B $colorfg --bold
        set -U __color_vi_mode_visual           $base09 $colorfg --bold

        set -U __color_vagrant                  $base0C $colorfg --bold
        set -U __color_username                 $base02 $base0D
        set -U __color_rvm                      $base08 $colorfg --bold
        set -U __color_virtualfish              $base0D $colorfg --bold
    case '*'
        eval sh $HOME/.config/base16-shell/scripts/base16-harmonic-light.sh

        set -l colorfg $base07

        set -U __color_initial_segment_exit     $base05 $base08 --bold
        set -U __color_initial_segment_su       $base05 $base0B --bold
        set -U __color_initial_segment_jobs     $base05 $base0D --bold

        set -U __color_path                     $base01 $base05
        set -U __color_path_basename            $base01 $base06 --bold
        set -U __color_path_nowrite             $base01 $base08
        set -U __color_path_nowrite_basename    $base01 $base08 --bold

        set -U __color_repo                     $base0B $colorfg
        set -U __color_repo_work_tree           $base01 $colorfg --bold
        set -U __color_repo_dirty               $base08 $colorfg
        set -U __color_repo_staged              $base09 $colorfg

        set -U __color_vi_mode_default          $base03 $colorfg --bold
        set -U __color_vi_mode_insert           $base0B $colorfg --bold
        set -U __color_vi_mode_visual           $base09 $colorfg --bold

        set -U __color_vagrant                  $base0C $colorfg --bold
        set -U __color_username                 $base02 $base0D
        set -U __color_rvm                      $base08 $colorfg --bold
        set -U __color_virtualfish              $base0D $colorfg --bold
end
