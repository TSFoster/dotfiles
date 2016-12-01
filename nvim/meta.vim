command! -bar RefreshRC source $HOME/.config/nvim/init.vim

nnoremap <Leader>rc :RefreshRC<CR>
nnoremap <Leader>pi :RefreshRC \| PlugInstall<CR>
nnoremap <Leader>pc :RefreshRC \| PlugClean!<CR>
nnoremap <Leader>pu :PlugUpdate<CR>
nnoremap <Leader>pU :PlugUpgrade<CR>
