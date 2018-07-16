Plugin 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plugin 'junegunn/fzf.vim'
Plugin 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

function! CreateFileIn(dir)
  if type(a:dir) == v:t_list
    for i in a:dir
      call CreateFileIn(i)
    endfor
  else
    let filename = input('Enter filename: ')
    let fullpath = fnamemodify(a:dir, ':p:h') . '/' . filename
    execute "normal :edit " . fullpath . "\<CR>"
  endif
endfunction

let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_action = {
      \ 'ctrl-e': funcref('CreateFileIn'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }


command! -bang -nargs=? -complete=dir Dirs
      \ call fzf#run(fzf#wrap('Dirs', {
      \ 'source': "fd --type directory $FD_DEFAULT_FLAGS",
      \ 'dir': <q-args>
      \ }, <bang>0))

nnoremap <silent> <Leader>e :FZF<CR>
nnoremap <silent> <Leader>E :FZF %:h<CR>
nnoremap <silent> <Leader>d :Dirs<CR>
nnoremap <silent> <Leader>D :Dirs %:h<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>B :BLines<CR>
nnoremap <silent> <Leader>he :Helptags<CR>
nnoremap <silent> <Leader>hi :History<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
nnoremap <silent> <Leader>: :History:<CR>
nnoremap <silent> <Leader>g<Leader> :GFiles?<CR>
nnoremap <silent> <Leader>T :Tags<CR>


if executable('rg')
  set grepprg=rg\ --vimgrep
endif
nnoremap <Leader>a :silent! grep<Space>
nnoremap <Leader>A :silent! grepadd<Space>

" vim: tabstop=2 softtabstop=2 shiftwidth=2
