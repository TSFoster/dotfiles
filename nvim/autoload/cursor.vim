let s:_s = ''
let s:l = ''
let s:c = ''

function cursor#preserve(command)
  call cursor#save()
  execute a:command
  call cursor#restore()
endfunction

function cursor#save()
  let s:_s=@/
  let s:l = line(".")
  let s:c = col(".")
endfunction

function cursor#restore()
  let @/=s:_s
  call cursor(s:l, s:c)
endfunction
