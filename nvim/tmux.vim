Plugin 'roxma/vim-tmux-clipboard'

Plugin 'christoomey/vim-tmux-navigator'
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

let g:prosession_tmux_title = 1
let g:prosession_tmux_title_format = "editor: #[italics]@@@#[noitalics]"
