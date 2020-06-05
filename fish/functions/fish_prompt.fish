function fish_prompt
  set last_status $status

  set --query prompt_count
  or set --global prompt_count 0

  set --query prompt_pid
  or set --global prompt_pid

  set promptfile /tmp/fish-prompt-(string replace -a '/' '%' $PWD)

  set project_path_color black
  set project_dir_color red
  set branch_color green
  set pwd_path_color $project_path_color
  set pwd_dir_color blue

  set last_status_color red
  test $last_status -eq 0
  and set last_status_color normal
  and set last_status ' '
  or set last_status \u2524_$last_status

  if test $prompt_count -ne 0; and not test -f $promptfile
    echo \n\n(prompt_base_and_dir $PWD)\n > $promptfile
  end

  begin
    count $prompt_pid > /dev/null
    and ps -p $prompt_pid > /dev/null
    and kill -TERM $prompt_pid > /dev/null 2>&1
  end

  if test $prompt_count -eq 0
    # Fish doesn't like the asynchronous trick on the first prompt :shrug:
    __fish_prompt_git_info $promptfile
  else
    begin
      __fish_prompt_git_info $promptfile $fish_pid &
      set prompt_pid (jobs -lp | tail -n1)
    end
  end

  set first_line (set_color $last_status_color)(printf '%'$COLUMNS's' $last_status | tr \  \u2500 | tr _ \ )

  set info (cat $promptfile)
  set info_length (string length (string join '' $info))

  set second_line (set_color $project_path_color; echo -n ''$info[1])
  set second_line $second_line(set_color $project_dir_color; echo -n ''$info[2])
  set second_line $second_line(set_color $pwd_path_color; echo -n ''$info[3])
  set second_line $second_line(set_color $pwd_dir_color; echo -n ''$info[4])
  set second_line $second_line\ (set_color $branch_color; echo -n ''$info[5])
  set second_line $second_line(printf '%-'(expr $COLUMNS - $info_length - 1)'s' '')

  set third_line (set_color $mode_color)\u25b8(set_color normal)

  echo $first_line
  echo $second_line
  echo -n $third_line\ 
end
