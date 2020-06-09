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
complete --command=p --short-option=l --long-option=list --description='List all projects'
complete --command=p --short-option=d --long-option=delete --description='Delete project definition'
complete --command=p --short-option=f --long-option=force --description='Re-set project path, or ignore missing project warning'
