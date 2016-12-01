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

nnoremap <Leader>e :FZF<CR>
nnoremap <Leader>A :Ag<Space>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>B :BLines<CR>
nnoremap <Leader>he :Helptags<CR>
nnoremap <Leader>hi :History<CR>
nnoremap <Leader>f :History/<CR>
nnoremap <Leader>: :History:<CR>
nnoremap <Leader>g<Leader> :GFiles?<CR>
nnoremap <Leader>s :Session<CR>
nnoremap <Leader>S :Session!<CR>


Plugin 'mhinz/vim-grepper'
nnoremap <Leader>a :Grepper<CR>
if !exists('g:grepper')
  let g:grepper = {
    \ 'highlight': 1,
    \ 'jump': 1,
    \ 'switch': 0,
    \ 'ag': {
      \ 'escape': '\^$.*+?()[]{}|',
      \ 'grepformat': '%f:%l:%c:%m, %f:%l:%m',
      \ 'grepprg': 'ag --vimgrep --smart-case'
    \ },
    \ 'tools': ['ag', 'grep', 'git']
  \ }
endif
