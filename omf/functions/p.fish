set workspace ~/workspace
set projectsDir ~/.local/share/projects

function p
  set -l options \
    (fish_opt --short=d --long=delete) \
    (fish_opt --short=f --long=force) \
    (fish_opt --short=h --long=help)
  argparse $options -- $argv

  set cmd (basename (status function))

  if set -q _flag_help
    echo "$cmd -h | --help"
    echo '    This help message.'
    echo ''
    echo "$cmd"
    echo '    List all projects.'
    echo ''
    echo "$cmd NAME [ PATH [ -f  --force ] ]"
    echo '    Start project NAME, optionally (force re-)setting project root.'
    echo ''
    echo "$cmd [ -d | --delete ] [ -f | --force ] NAME..."
    echo '    Delete project NAME. Use -f/--force to supress non-existance warnings.'
    return 0
  end

  if set -q _flag_delete
    if [ (count $argv) -eq 0 ]; and not set -q _flag_force
      echo 'No project names given!' >&2
      return 1
    end
    for projectName in $argv
      set -l projectInfo $projectsDir/$projectName.txt
      if not test -f $projectInfo; and not set -q _flag_force
        echo "Project ‘$projectName’ doesn’t exist!" >&2
      end
      rm -f $projectInfo
    end
    return 0
  end

  if [ (count $argv) -eq 0 ]
    for projectName in (__fish_p_all_project_names)
      echo (set_color --bold)$projectName(set_color normal): (__fish_p_get_project_path $projectName ^ /dev/null)
    end
    return 0
  end

  if [ "$NVIM_LISTEN_ADDRESS" ]
    echo "Will not run nvim from within nvim" >&2
    return 1
  end

  set projectName $argv[1]
  set projectInfo $projectsDir/$projectName.txt

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
      if set -q $argv[2]
        set newPath $argv[2]
      else
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

  cd $projectPath
  abduco -A nvim-$projectName nvim
end

function __fish_p_all_project_names
  mkdir -p $projectsDir
  mkdir -p $workspace

  set projectDefs (string replace -r ".*/([^/]*).txt" '$1' $projectsDir/*.txt)
  set workspaceDirs (ls -p $workspace | grep '/$' | sed 's/\///')

  set projectNames home
  [ (count $projectDefs) -gt 0 ]; and set projectNames $projectNames $projectDefs
  [ (count $workspaceDirs) -gt 0 ]; and set projectNames $projectNames $workspaceDirs

  begin
    for projectName in $projectNames
      echo $projectName
    end
  end | sort | uniq
end

function __fish_p_get_project_path
  if not set -q argv[1]
    echo 'No project name given.' >&2
    return 1
  end
  set projectName $argv[1]

  if [ $projectName = home ]
    echo $HOME
  else if [ -f $projectsDir/$projectName.txt ]
    cat $projectsDir/$projectName.txt
  else if [ -d $workspace/$projectName ]
    echo $workspace/$projectName
  else
    echo 'New directory must be created.' >&2
    return 1
  end

  return 0
end

function __fish_p_at_stage
  set cmd (commandline -opc)

  if [ (count $cmd) -eq $argv[1] ]
    return 0
  end

  return 1
end

complete -fc p -n '__fish_p_at_stage 1' -a '(__fish_p_all_project_names)'
complete -c p -n '__fish_p_at_stage 2'
