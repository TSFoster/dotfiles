set t_ts=k
set t_fs=\
function! SetTitlestring()
    let cwd = getcwd()
    let fp = expand('%:p')
    if fp == '' || fp =~? '^'.$VIMRUNTIME
        return cwd
    else
        return fp
    end
endfunction
auto BufEnter * :set title | let &titlestring = SetTitlestring()
auto VimLeave * :set t_ts=k\
