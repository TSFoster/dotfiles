function prompt_base_and_dir
  set path (string replace -r '^'"$HOME"'($|/)' '~$1' ''$argv[1])
  switch "$path"
    case ''
      echo \n
    case '/' '~'
      echo \n$path
    case '*'
      set x (string replace -ar '(\.?[^/]{1})[^/]*/' '$1/' $path | string split --max 1 --right '/')
      echo $x[1]'/'
      echo $x[2]
  end
end
