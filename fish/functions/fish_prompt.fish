function fish_prompt
  set last_status $status

  set --query prompt_count
  or set --global prompt_count 0

  set --query prompt_pid
  or set --global prompt_pid

  set promptfile /tmp/fish-prompt-$fish_pid-$prompt_count

  set project_dir_color black
  set branch_color green
  set pwd_color blue

  set last_status_color red
  test $last_status -eq 0
  and set last_status_color normal
  and set last_status ' '
  or set last_status \u2524_$last_status

  if test -f $promptfile
    set gitinfo (cat $promptfile)
  else
    set gitinfo (prompt_pwd)
    count /tmp/fish-prompt-$fish_pid-* > /dev/null
    and rm /tmp/fish-prompt-$fish_pid-*
    touch $promptfile

    begin
      count $prompt_pid > /dev/null
      and ps -p $prompt_pid > /dev/null
      and kill -TERM $prompt_pid > /dev/null 2>&1
    end

    if test $prompt_count -eq 0
      # Fish doesn't like the asynchronous trick on the first prompt
      set gitinfo (__fish_prompt_git_info /dev/stdout)
    else
      begin
        __fish_prompt_git_info $promptfile $fish_pid &
        set prompt_pid (jobs -lp | tail -n1)
      end
    end
  end

  set first_line (set_color $last_status_color)(printf '%'$COLUMNS's' $last_status | tr \  \u2500 | tr _ \ )

  set second_line (set_color $project_dir_color; echo -n $gitinfo[1])
  set second_line $second_line\ (set_color $branch_color; echo -n $gitinfo[2])
  set second_line $second_line(set_color $pwd_color; echo -n $gitinfo[3])
  set second_line (printf '%-'$COLUMNS's' $second_line)

  set third_line (set_color $mode_color)\u25b8(set_color normal)

  echo $first_line
  echo $second_line
  echo -n $third_line\ 
end
