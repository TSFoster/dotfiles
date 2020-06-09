function p
  set projects $XDG_DATA_HOME/projects

  if not count $argv > /dev/null
    set match (grep --files-with-match $PWD\$ $projects/*.txt)
    if count $match >/dev/null
      p (filename $match[1])
      return 0
    else if test $workspace/(basename $PWD) = $PWD
      p (basename $PWD)
      return 0
    end

    echo 'What project should I start?' >&2
    return 1
  end

  set -l options \
    (fish_opt --short=d --long=delete) \
    (fish_opt --short=f --long=force) \
    (fish_opt --short=l --long=list) \
    (fish_opt --short=h --long=help)
  argparse $options -- $argv

  set cmd (basename (status function))

  if set -q _flag_help
    echo "$cmd -h | --help"
    echo '    This help message.'
    echo ''
    echo "$cmd"
    echo '    Look for a project associated with your pwd and launch that.'
    echo ''
    echo "$cmd -l | --list"
    echo '    List all projects.'
    echo ''
    echo "$cmd NAME [ PATH [ -f  --force ] ]"
    echo '    Start project NAME, optionally (force re-)setting project root. If the'
    echo '    function is called from within a command substitution, print the path'
    echo '    to the project.'
    echo ''
    echo "$cmd [ -d | --delete ] [ -f | --force ] NAME..."
    echo '    Delete project NAME. Use -f/--force to supress non-existence warnings.'
    return 0
  end

  if set -q _flag_delete
    if [ (count $argv) -eq 0 ]; and not set -q _flag_force
      echo 'No project names given!' >&2
      return 1
    end
    for projectName in $argv
      set -l projectInfo $projects/$projectName.txt
      if not test -f $projectInfo; and not set -q _flag_force
        echo "Project ‘$projectName’ doesn’t exist!" >&2
      end
      rm -f $projectInfo
    end
    return 0
  end

  if set -q _flag_list
    for projectName in (__fish_p_all_project_names)
      echo (set_color --bold)$projectName(set_color normal): (__fish_p_get_project_path $projectName 2> /dev/null)
    end
    return 0
  end

  [ "$NVIM_LISTEN_ADDRESS" ]
  and not status --is-command-substitution
  and echo "Will not run nvim from within nvim" >&2
  and return 1

  set projectName $argv[1]
  set projectInfo $projects/$projectName.txt

  if [ "$projectName" = home ]
    set projectPath $HOME
  else if [ -f $projectInfo ]
    set projectPath (cat $projectInfo)
    if [ (count $argv) -ge 2 ]
      if set -q _flag_force
        [ -d $argv[2] ]; or echo 'Creating new directory.' >&2
        mkdir -p $argv[2]
        cd $argv[2]
        set projectPath (pwd)
        echo "Changing project root to $projectPath" >&2
        echo $projectPath > $projectInfo
      else
        echo 'Project is already defined, ignoring new root.' >&2
      end
    end
    if not [ -d $projectPath ]
      if set -q _flag_force
        mkdir -p $projectPath
      else
        echo "$projectPath no longer exists!" >&2
        return 1
      end
    end
  else
    if [ -d $workspace/$projectName ]
      set projectPath $workspace/$projectName
    else
      if set -q argv[2]
        set newPath $argv[2]
      else
        read --prompt-str="Create new project called $projectName (y/n)? " --nchars=1 shouldCreate
        [ $shouldCreate != 'y' ]; and return 0
        set newPath (pwd)
      end
      [ -d $newPath ]; or echo 'Creating new directory.' >&2
      mkdir -p $newPath
      cd $newPath
      set projectPath (pwd)
      echo "Creating project ‘$projectName’ in $projectPath." >&2
      echo $projectPath > $projectInfo
    end
  end

  if status --is-command-substitution
    echo $projectPath
  else
    cd $projectPath
    abduco -A nvim-$projectName nvim
  end
end
