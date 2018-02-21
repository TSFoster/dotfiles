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


command! -bang Session
    \ call fzf#run({
        \ 'source': prosession#ProsessionComplete('','',0),
        \ 'sink': 'Prosession' . (<bang>0 ? 'Delete' : ''),
        \ 'options': '--prompt="Session' . (<bang>0 ? ' to delete: "' : ': "')
    \ })



command! -bang -nargs=? -complete=dir Dirs
    \ call fzf#run(fzf#wrap('Dirs', {
        \ 'source': 'fd --type directory --exclude node_modules --exclude .git --exclude elm-stuff --exclude bower_components --no-ignore-vcs',
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
nnoremap <silent> <Leader>f :History/<CR>
nnoremap <silent> <Leader>: :History:<CR>
nnoremap <silent> <Leader>g<Leader> :GFiles?<CR>
nnoremap <silent> <Leader>s :Session<CR>
nnoremap <silent> <Leader>S :Session!<CR>


Plugin 'mhinz/vim-grepper'
nnoremap <silent> <Leader>a :Grepper<CR>
let g:grepper = { 'tools': ['rg', 'git'] }
