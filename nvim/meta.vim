command! -bar RefreshRC source $HOME/.config/nvim/init.vim

nnoremap <silent> <Leader>rc :RefreshRC<CR>
nnoremap <silent> <Leader>pi :RefreshRC \| PlugInstall<CR>
nnoremap <silent> <Leader>pc :RefreshRC \| PlugClean!<CR>
nnoremap <silent> <Leader>pu :PlugUpdate<CR>
nnoremap <silent> <Leader>pU :PlugUpgrade<CR>
nnoremap <silent> <Leader>cu :CocUpdate<CR>
nnoremap <silent> <Leader>cc :CocConfig<CR>

" vim: tabstop=2 softtabstop=2 shiftwidth=2
