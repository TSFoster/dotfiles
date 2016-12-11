Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'

let g:prosession_dir = '~/.config/nvim/sessions/'

command! ProsessionDeleteAll Obsession! | silent execute
      \ "!rm -f ~/.config/nvim/sessions/*"
command! -nargs=1 ProsessionDelete silent execute
      \ "!rm -f ~/.config/nvim/sessions/" . substitute(<q-args>, '/', '\\%', 'g') . ".vim"

nnoremap <Leader><Leader>s :Prosession ~/
