set statusline=
set statusline+=%2*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%3*\ %{(&paste?\",PASTE\":\"\")}\         "Paste mode
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\                       "Spellanguage & Highlight on?
set statusline+=%3*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%4*\ col:%03c\                            "Colnr
set statusline+=%4*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
