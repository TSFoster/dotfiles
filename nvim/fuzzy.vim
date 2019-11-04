Plugin 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plugin 'junegunn/fzf.vim'

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

function! PopulateArgs(files)
  execute "normal :args " . join(a:files, ' ') . "\<CR>"
endfunction

let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_action = {
      \ 'ctrl-e': funcref('CreateFileIn'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-a': funcref('PopulateArgs') }

function! BatConfig()
  return 'bat --color=always --decorations=always --theme=ansi-' . &background . ' {}'
endfunction

command! -bang -nargs=? -complete=file Files
      \ call fzf#run(fzf#wrap('ProjectFiles', {
      \   'options': "--multi --preview '" . BatConfig() . "'",
      \   'dir': <q-args>
      \ }, <bang>0))

command! -bang -nargs=? -complete=dir Dirs
      \ call fzf#run(fzf#wrap('Dirs', {
      \   'source': "fd --type directory $FD_DEFAULT_FLAGS",
      \   'dir': <q-args>
      \ }, <bang>0))

nnoremap <silent> <Leader>e :Files<CR>
nnoremap <silent> <Leader>E :Files %:h<CR>
nnoremap <silent> <Leader>d :Dirs<CR>
nnoremap <silent> <Leader>D :Dirs %:h<CR>

nnoremap <silent> <Leader>h: :CocList cmdhistory<CR>
nnoremap <silent> <Leader>h/ :CocList searchhistory<CR>
nnoremap <silent> <Leader>mr :CocList mru<CR>
nnoremap <silent> <Leader>he :CocList helptags<CR>
nnoremap <silent> <Leader>ta :CocList tags<CR>
nnoremap <silent> <Leader>b :CocList buffers<CR>
nnoremap <silent> <Leader>B :CocList lines<CR>

if executable('rg')
  set grepprg=rg\ --vimgrep
endif
nnoremap <Leader>a :silent! grep<Space>
nnoremap <Leader>A :silent! grepadd<Space>
nnoremap <Leader><Leader>a :silent! lgrep<Space>
nnoremap <Leader><Leader>A :silent! lgrepadd<Space>

" vim: tabstop=2 softtabstop=2 shiftwidth=2
