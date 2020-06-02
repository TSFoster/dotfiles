function __fish_p_get_project_path
  if not set -q argv[1]
    echo 'No project name given.' >&2
    return 1
  end
  set projectName $argv[1]

  if [ $projectName = home ]
    echo $HOME
  else if [ -f $projects/$projectName.txt ]
    cat $projects/$projectName.txt
  else if [ -d $workspace/$projectName ]
    echo $workspace/$projectName
  else
    echo 'New directory must be created.' >&2
    return 1
  end

  return 0
end
