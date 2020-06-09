function __fish_p_all_project_names
  set projects $XDG_DATA_HOME/projects

  mkdir -p $projects
  mkdir -p $workspace

  set projectDefs (string replace -r ".*/([^/]*).txt" '$1' $projects/*.txt)
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
