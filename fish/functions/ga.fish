function ga
  if [ (count $argv) -eq 0 ]
    git add .
  else
    git add $argv
  end
end
