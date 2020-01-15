alias git hub
abbr -a g git

abbr -a gs git status
abbr -a gd git diff
abbr -a gdc git diff --cached
abbr -a gst git stash
abbr -a gsp git stash pop
abbr -a gca git commit --amend
abbr -a gcane git commit --amend --no-edit

function ga
  if [ (count $argv) -eq 0 ]
    git add .
  else
    git add $argv
  end
end

function gc
  if [ (count $argv) -eq 0 ]
    git commit
  else
    git commit -m $argv
  end
end

function rebase_last
  git rebase -i HEAD~$argv
end
