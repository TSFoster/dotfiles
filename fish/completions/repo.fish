complete -f -c repo -a '(find ~/repos -maxdepth 3 -name .git -type d | sed \'s/^.*repos\/\(.*\)\/.git$/\1/g\')'
