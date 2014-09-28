let g:MachineType = 'Unknown'
let s:uname = system('uname -s')
if has('unix')
  if s:uname == "Darwin\n"
    let g:MachineType = 'Mac'
  endif
endif
