alias git lab
abbr -a g git

abbr -a gs git status
abbr -a gd git diff
abbr -a gdc git diff --cached
abbr -a gst git stash
abbr -a gsp git stash pop
abbr -a gca git commit --amend

if [ (type -t gittower 2> /dev/null; or echo 'fail') = 'file' ]
  function tower
    if [ (count $argv) -gt 0 ]
      command gittower $argv
    else
      set -l root (git root ^/dev/null)
      if [ -z "$root" ]
        echo "You are not in a git repo" >&2
        exit 1
      else
        command gittower $root
      end
    end
  end
end

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
