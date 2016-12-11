Plugin 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plugin 'junegunn/fzf.vim'
Plugin 'fszymanski/fzf-gitignore.nvim', {'do': ':UpdateRemotePlugins'}

command! -bang Session
    \ call fzf#run({
        \ 'source': prosession#ProsessionComplete('','',0),
        \ 'sink': 'Prosession' . (<bang>0 ? 'Delete' : ''),
        \ 'down': '~40%',
        \ 'options': '--prompt="Session' . (<bang>0 ? ' to delete: "' : ': "')
    \ })

nnoremap <silent> <Leader>e :FZF<CR>
nnoremap <silent> <Leader>A :Ag<Space>
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
if !exists('g:grepper')
  let g:grepper = {
    \ 'highlight': 1,
    \ 'ag': {
      \ 'escape': '\^$.*+?()[]{}|',
      \ 'grepformat': '%f:%l:%c:%m, %f:%l:%m',
      \ 'grepprg': 'ag --vimgrep --smart-case'
    \ },
    \ 'tools': ['ag', 'grep', 'git']
  \ }
endif
