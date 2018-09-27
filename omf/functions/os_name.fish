function os_name
  set OS Unknown
  uname | grep -q Darwin; and set OS Mac
  echo $OS
end
