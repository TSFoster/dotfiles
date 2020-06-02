function gc
  if [ (count $argv) -eq 0 ]
    git commit
  else
    git commit -m $argv
  end
end
