Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'

let g:prosession_dir = '~/.local/share/nvim/sessions/'

command! ProsessionDeleteAll Obsession! | silent execute
      \ "!rm -f ~/.local/share/nvim/sessions/*"
command! -nargs=1 ProsessionDelete silent execute
      \ "!rm -f ~/.local/share/nvim/sessions/" . substitute(<q-args>, '/', '\\%', 'g') . ".vim"

nnoremap <Leader><Leader>s :Prosession ~/

" vim: tabstop=2 softtabstop=2 shiftwidth=2
