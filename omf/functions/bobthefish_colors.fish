function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'
  set -l shell_path $OMF_CONFIG/colors/base16-strange_harmony
  set -e fish_pager_color_prefix
  set -l theme_file ~/.local/share/dark_mode
  [ -f $theme_file ]; or ~/.config/theme/setup
  switch (cat $theme_file)
      case 'true'
          eval sh $shell_path.dark.sh
          set -Ux fish_pager_color_prefix brblack
          set colorfg black
          set colorseg grey
          set colorpath brgrey white
      case '*'
          eval sh $shell_path.light.sh
          set -Ux fish_pager_color_prefix white
          set colorfg brwhite
          set colorseg brgrey
          set colorpath grey black
  end

  set -Ux color_initial_segment_exit     $colorseg red --bold
  set -Ux color_initial_segment_su       $colorseg green --bold
  set -Ux color_initial_segment_jobs     $colorseg blue --bold

  set -Ux color_vagrant                  brcyan $colorfg
  set -Ux color_rvm                      brmagenta $colorfg --bold
  set -Ux color_virtualfish              brblue $colorfg --bold

  set -Ux color_path_nowrite             magenta $colorfg
  set -Ux color_path_nowrite_basename    magenta $colorfg --bold

  set -Ux color_repo                     green $colorfg
  set -Ux color_repo_work_tree           grey $colorfg --bold
  set -Ux color_repo_dirty               brred $colorfg
  set -Ux color_repo_staged              yellow $colorfg

  set -Ux color_vi_mode_default          brblue $colorfg --bold
  set -Ux color_vi_mode_insert           brgreen $colorfg --bold
  set -Ux color_vi_mode_visual           bryellow $colorfg --bold

  set -Ux color_path                     $colorpath
  set -Ux color_path_basename            $colorpath --bold
  set -Ux color_username                 $colorpath

  set -e colorfg
  set -e colorseg
  set -e colorpath
end
