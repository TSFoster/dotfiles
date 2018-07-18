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

complete --command=p --condition='__fish_p_at_stage 1' --arguments='(__fish_p_all_project_names)' --no-files
complete --command=p --condition='__fish_p_at_stage 2'
complete --command=p --short-option=h --long-option=help --description='Show help'
complete --command=p --short-option=d --long-option=delete --description='Delete project definition'
complete --command=p --short-option=f --long-option=force --description='Re-set project path, or ignore missing project warning'
