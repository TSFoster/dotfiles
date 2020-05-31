" TODO investigate https://github.com/tracyone/neomake-multiprocess and https://github.com/neomake/neomake
" TODO investigate https://github.com/coachshea/neo-pipe
" TODO investigate https://github.com/tpope/vim-projectionist
" TODO make own collection of snippets (crib from honza/vim-snippets)
" TODO go through pack/trialling
" TODO remove miniyank?
" TODO investigate turning off termguicolors permanently or selectively turn on
" TODO add definitions for vim-partial
" TODO :term clipboard/fish clipboard/vim clipboard/system clipboard

" Mouse in all modes
if has('mouse') | set mouse=a | endif

" Don't slow macros down by rendering every step
set lazyredraw

" Set 24 bit color
set termguicolors

" Show line numbers
set number relativenumber

" Use smart case sensitivity in searches
set ignorecase smartcase

" Make command line complete case insensitive
set wildignorecase

" On first <tab>, show all available options, cycle through options on subsequent <tab>s
set wildmode=list,full

" Don't unload hidden buffers
set hidden

" Don't write backups to same directory, to avoid issues with coc.nvim issue 649
set backupdir-=.

" Look through entire project for files
set path+=**

" Give messages more space to display
set cmdheight=2

" Write to swap file quickly so that coc.nvim can update faster
set updatetime=300

" Don’t show messages related to completion menu in command line
set shortmess+=c

" Start scrolling when cursur reaches x lines from edge
set scrolloff=5

" Use par by default to format text
set formatprg=par\ rqw80

" Use "*" clipboard by default (for OS integration)
set clipboard=unnamed
set pastetoggle=<F2>

set list listchars=tab:▸\ ,trail:· " Show trailing tabs and spaces
set breakindent showbreak=…\  " Visually indent wrapped lines to match whitespace and prepend with ‘… ’

" Spaces by default
set expandtab

" Don’t fix missing EOL at EOF (for when editing others’ code)
set nofixendofline

" Default split positions
set splitbelow splitright

set spelllang=en_gb

set undofile undolevels=1000 undoreload=1000 " Store 1000 undos in a file and keep them on buffer reload
set viminfo='1000,f1,<500 " Keep marks for 1000 files, store global marks, limit viminfo to 500 lines

" Restore last cursor position
augroup cursor_position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

call statusline#init()
call titlebar#init()
call colors#init()

let g:netrw_preview=1 " Vertical preview

" Overrides vim-unimpaired’s map for toggling cursorcolumn
nnoremap <silent> you :UndotreeToggle<CR>
let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 1
let g:undotree_SetFocusWhenToggle = 0

let g:camelcasemotion_key = '\'

let g:kickfix_zebra=0

set inccommand=nosplit
nnoremap <silent> yoS :call toggle#inccommand()<CR>

" Space is a great <Leader>.
" It is a large button that can be hit by either hand without moving.
let mapleader="\<Space>"

" jj is a rare combination that stays on the home row and is faster than
" hitting <C-[> or <ESC>. Only common clash is when the last character you
" insert is a j, in which case you can type "jkj".
inoremap jj <ESC>
inoremap jkj j<ESC>

" Use backspace to flip between two files
nnoremap <BS> <C-^>

" Semi-colon is much faster to type than colon
nnoremap ; :
vnoremap ; :
nnoremap q; q:

" Use gQ if wanting to go into ex mode. Q for repeating last macro
nnoremap Q @@

" %% in command line maps to current file's directory
cnoremap <expr> %% fnameescape(expand('%:h').'/')
" %p in command line maps to current file's path
cnoremap <expr> %p fnameescape(expand('%:p'))
" %p in command line maps to current file's relative path
cnoremap <expr> %r fnameescape(expand('%'))

nnoremap <silent> <Leader>q :call buffer#quit()<CR>
nnoremap <silent> <Leader><Leader>q write <Bar> call buffer#quit()<CR>
nnoremap <silent> <Leader>w :call buffer#update()<CR>

" Common substitution patterns, accessible with one button press (on a Mac
" keyboard, at least)
nmap § :%s//g<LEFT><LEFT>
vmap § :s//g<LEFT><LEFT>

nnoremap <silent> <q :<c-u>for _ in range(v:count1) <Bar> colder <Bar> endfor<CR>
nnoremap <silent> >q :<c-u>for _ in range(v:count1) <Bar> cnewer <Bar> endfor<CR>
nnoremap <silent> <l :<c-u>for _ in range(v:count1) <Bar> lolder <Bar> endfor<CR>
nnoremap <silent> >l :<c-u>for _ in range(v:count1) <Bar> lnewer <Bar> endfor<CR>
nnoremap <silent> <Q :try <Bar> while 1 > 0 <Bar> silent colder <Bar> endwhile <Bar> catch // <Bar> endtry<CR>
nnoremap <silent> >Q :try <Bar> while 1 > 0 <Bar> silent cnewer <Bar> endwhile <Bar> catch // <Bar> endtry<CR>
nnoremap <silent> <L :try <Bar> while 1 > 0 <Bar> silent lolder <Bar> endwhile <Bar> catch // <Bar> endtry<CR>
nnoremap <silent> >L :try <Bar> while 1 > 0 <Bar> silent lnewer <Bar> endwhile <Bar> catch // <Bar> endtry<CR>

" When using CTRL-C key to leave insert mode, it does not trigger the autocmd InsertLeave
inoremap <c-c> <ESC>

" Map C-z to M-z to allow detaching from abduco within abduco nvim
tnoremap <M-z> <C-z>

" Convert bases. This overrides builtin gh (select mode), but I never use that.
nnoremap <silent> gh ciw<C-r>=printf('0x%x', <C-r>")<CR><Esc>

let g:fugitive_git_executable='command git'

nnoremap <silent> <Leader>ga :Gwrite<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gps :Gpush<CR>
nnoremap <silent> <Leader>gpl :Gpull<CR>
nnoremap <silent> <Leader>gco :Gcommit<CR>
nnoremap <silent> <Leader>gca :Gcommit --amend<CR>
nnoremap <silent> <Leader>gre :<C-U>execute("Grebase -i HEAD~" . v:count1)<CR>

nnoremap <silent> <Leader>gi :CocList gitignore<CR>
nnoremap <silent> <Leader>ge :CocList gstatus<CR>
nnoremap <silent> <Leader>gE :CocList gfiles<CR>
nnoremap <silent> <Leader>gC :CocList commits<CR>

" navigate hunks of current buffer
nmap [h <Plug>(coc-git-prevchunk)
nmap ]h <Plug>(coc-git-nextchunk)
nmap <Leader>hp <Plug>(coc-git-chunkinfo)
nmap <Leader>ha :CocCommand git.chunkStage<CR>
nmap <Leader>hu :CocCommand git.chunkUndo<CR>
" show commit contains current position
nmap <Leader>cp <Plug>(coc-git-commit)
" create text object for git chunks
omap ic <Plug>(coc-text-object-inner)
xmap ic <Plug>(coc-text-object-inner)
omap ac <Plug>(coc-text-object-outer)
xmap ac <Plug>(coc-text-object-outer)

let g:targets_nl = ['n', 'N']

nnoremap <silent> <Leader>d :CocList files --type=directory<CR>
nnoremap <silent> <Leader>D :CocList files %:p:h --type=directory<CR>
nnoremap <silent> <Leader>e :CocList files --type=file<CR>
nnoremap <silent> <Leader>E :CocList files %:p:h --type=file<CR>
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

map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <Leader>y <Plug>(miniyank-cycle)
map <Leader>Y <Plug>(miniyank-cycleback)
map <Leader>c <Plug>(miniyank-tochar)
map <Leader>l <Plug>(miniyank-toline)

" Alt-R to paste buffer in terminal mode
tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'

command! -bar ReloadConfig execute 'source ' . stdpath('config') . '/init.vim'

nnoremap <silent> <Leader>cu :CocUpdate<CR>
nnoremap <silent> <Leader>cc :CocConfig<CR>

if !exists('$SSH_CLIENT')
  nmap <silent> <Leader>/. :set opfunc=search#DuckDuckGo<CR>g@
  vmap <silent> <Leader>/. :<C-U>call search#DuckDuckGo('visual')<CR>
  nmap <silent> <Leader>/g :set opfunc=search#Github<CR>g@
  vmap <silent> <Leader>/g :<C-U>call search#Github('visual')<CR>
  nmap <silent> <Leader>/d :set opfunc=search#Dict<CR>g@
  vmap <silent> <Leader>/d :<C-U>call search#Dict('visual')<CR>
  nmap <silent> <Leader>/c :set opfunc=search#CanIUse<CR>g@
  vmap <silent> <Leader>/c :<C-U>call search#CanIUse('visual')<CR>
  nmap <silent> <Leader>/w :set opfunc=search#Wikipedia<CR>g@
  vmap <silent> <Leader>/w :<C-U>call search#Wikipedia('visual')<CR>
endif

command! -nargs=+ Keywordprg call keywordprg#run('<args>')<CR>
set keywordprg=:Keywordprg

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <A-Tab> coc#refresh()
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ (!(col('.') - 1) <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <CR> to confirm completion, <C-g>u means break undo chain at current position.
inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <Leader>r <Plug>(coc-rename)

" Remap for format selected region
xmap <silent> <Leader>f  <Plug>(coc-format-selected)
nmap <silent> <Leader>f  <Plug>(coc-format)

augroup cocnvim
  autocmd!
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

" Remap for do codeAction of selected region (or line), ex: `<leader>aap` for current paragraph
xmap <Leader>;  <Plug>(coc-codeaction-selected)
nmap <Leader>;  <Plug>(coc-codeaction-selected)
nmap <Leader>;c  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <Leader>cf  <Plug>(coc-fix-current)

" Create mappings for function and class text objects, requires document symbols feature of languageserver.
xmap <silent> if <Plug>(coc-funcobj-i)
xmap <silent> af <Plug>(coc-funcobj-a)
omap <silent> if <Plug>(coc-funcobj-i)
omap <silent> af <Plug>(coc-funcobj-a)
xmap <silent> ic <Plug>(coc-classobj-i)
xmap <silent> ac <Plug>(coc-classobj-a)
omap <silent> ic <Plug>(coc-classobj-i)
omap <silent> ac <Plug>(coc-classobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

call formatting#init()

nnoremap yot :TagbarToggle<CR>
nnoremap <Leader>] :tag<Space>

let g:polyglot_disabled = ['cryptol', 'markdown']

augroup doc
  autocmd!
  autocmd BufReadPost *.doc,*.docx,*.odp,*.odt silent %!pandoc "%" --to=markdown -o /dev/stdout
  autocmd BufReadPost *.rtf silent %!textutil "%" -convert html -stdout | pandoc --from=html --to=markdown
augroup END

highlight htmlItalic cterm=italic gui=italic
highlight htmlBold cterm=bold gui=bold
highlight Comment cterm=italic gui=italic

let g:rustfmt_autosave = 1

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

tnoremap ;; <C-\><C-n>:
tnoremap jj <C-\><C-n>
tmap <A-Space> <C-\><C-n><Leader>
nmap <A-Space> <Leader>

" Open new file below/above/to left/to right/inside current window
nnoremap <Leader>nj :rightbelow new <CR>
nnoremap <Leader>nk :leftabove new <CR>
nnoremap <Leader>nl :rightbelow vnew <CR>
nnoremap <Leader>nh :leftabove vnew <CR>
nnoremap <Leader>nn :enew<CR>
nnoremap <Leader>nN :tabnew<CR>

" Open terminal below/above/to left/to right/inside current window
nnoremap <Leader>tj :sp <BAR> term<CR>
nnoremap <Leader>tk :topleft sp <BAR> term<CR>
nnoremap <Leader>tl :vsp <BAR> term<CR>
nnoremap <Leader>th :leftabove vsp <BAR> term<CR>
nnoremap <Leader>tt :term<CR>
nnoremap <Leader>tT :tabnew <BAR> term<CR>

" Resize windows with alt+dir or equalise with alt+=
nnoremap <A-h> <C-w><
nnoremap <A-j> <C-w>-
nnoremap <A-k> <C-w>+
nnoremap <A-l> <C-w>>
nnoremap <A-=> <C-w>=
tnoremap <A-h> <C-\><C-n><C-w><i
tnoremap <A-j> <C-\><C-n><C-w>-i
tnoremap <A-k> <C-\><C-n><C-w>+i
tnoremap <A-l> <C-\><C-n><C-w>>i
tnoremap <A-=> <C-\><C-n><C-w>=i

" Automatically enter insert mode in terminal if it's not been scrolled back
augroup terminal_insert
  autocmd!
  autocmd BufEnter * if &buftype == 'terminal' && line('$') == line('w$') | :startinsert | endif
  autocmd TermOpen * if &buftype == 'terminal' | :startinsert | endif
augroup END

" Highlight both column and row on active window
augroup crosshairs
  autocmd!
  autocmd WinEnter * set cursorline cursorcolumn
  autocmd WinLeave * set nocursorline nocursorcolumn
augroup END

" Quick way to change tab stops. Add bang to reformat file
command! -bang -nargs=1 Stab call whitespace#set(<f-args>) | call cursor#preserve(<bang>0 ? 'normal gg=G' : '')

" Quick way to switch between tabs and spaces
nnoremap <silent> yo<Tab> :set expandtab! <Bar> echo (&expandtab ? 'Spaces (' . &shiftwidth . ')' : 'Tabs (' . &tabstop . ')')<CR>

nnoremap <silent> yoq :call toggle#quickfixList()<CR>
nnoremap <silent> yol :call toggle#locationList()<CR>


let g:lion_squeeze_spaces = 1
nnoremap <silent> yo<Bar> :let g:lion_squeeze_spaces=(g:lion_squeeze_spaces ? 0 : 1)<CR>

let g:switch_mapping = "<Tab>"
let g:switch_reverse_mapping = "<S-Tab>"

" Avoid conflicting with matchit.vim (see https://github.com/jeetsukumaran/vim-indentwise/issues/6)
map [<BS> <Plug>(IndentWiseBlockScopeBoundaryBegin)
map ]<BS> <Plug>(IndentWiseBlockScopeBoundaryEnd)

if isdirectory('/Applications/Dash.app') && !exists('$SSH_CLIENT') | packadd dash.vim | endif
