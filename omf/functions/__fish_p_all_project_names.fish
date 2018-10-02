function __fish_p_all_project_names
  mkdir -p $projectsDir
  mkdir -p $workspaceDir

  set projectDefs (string replace -r ".*/([^/]*).txt" '$1' $projectsDir/*.txt)
  set workspaceDirs (ls -p $workspaceDir | grep '/$' | sed 's/\///')

  set projectNames home
  [ (count $projectDefs) -gt 0 ]; and set projectNames $projectNames $projectDefs
  [ (count $workspaceDirs) -gt 0 ]; and set projectNames $projectNames $workspaceDirs

  begin
    for projectName in $projectNames
      echo $projectName
    end
  end | sort | uniq
end
