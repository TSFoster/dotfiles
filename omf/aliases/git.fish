alias git hub
abbr --add --global g git

abbr --add --global gs git status
abbr --add --global gd git diff
abbr --add --global gdc git diff --cached
abbr --add --global gst git stash
abbr --add --global gsp git stash pop
abbr --add --global gca git commit --amend
abbr --add --global gcane git commit --amend --no-edit

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
