call plug#begin(stdpath('config') . '/plugged')

Plug 'dbmrq/vim-dialect'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'itspriddle/vim-shellcheck'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'machakann/vim-swap'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-sleuth'

" Textobjects
Plug 'kana/vim-textobj-syntax'

" TODO investigate https://github.com/tracyone/neomake-multiprocess and https://github.com/neomake/neomake
" TODO investigate https://github.com/coachshea/neo-pipe
" TODO investigate https://github.com/tpope/vim-projectionist
" TODO make own collection of snippets (crib from honza/vim-snippets)

if has('mac')
  if isdirectory("/Applications/Marked 2.app")
    Plug 'itspriddle/vim-marked', { 'for': ['markdown'] }
  endif
  if isdirectory("/Applications/Dash.app")
    Plug 'rizzatti/dash.vim'
  endif
endif

call plug#end()

" Mouse in all modes
if has('mouse')
  set mouse=a
endif

" Don't slow macros down by rendering every step
set lazyredraw

" Set 24 bit color TODO investigate turning off permanently or selectively turn on
set termguicolors

" Show line numbers except in terminals
set number
augroup numbering
  autocmd! TermOpen * set nonumber
augroup END

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


" Restore last cursor position
augroup cursor_position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END


let g:python_host_prog = substitute(system('which python2'),'\n','','g')
let g:python3_host_prog = substitute(system('which python3'),'\n','','g')

call statusline#init()
call titlebar#init()
call colors#init()

set spelllang=en_gb

let g:netrw_preview=1 " Vertical preview

nnoremap <silent> <F5> :UndotreeToggle<CR>
let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 1
let g:undotree_SetFocusWhenToggle = 0

set undofile undolevels=1000 undoreload=1000 " Store 1000 undos in a file and keep them on buffer reload
set viminfo='1000,f1,<500 " Keep marks for 1000 files, store global marks, limit viminfo to 500 lines



let g:swap_no_default_key_mappings = 1
nmap g<Left> <Plug>(swap-prev)
nmap g<Right> <Plug>(swap-next)
nmap gs <Plug>(swap-interactive)

let g:camelcasemotion_key = '\'


let g:kickfix_zebra=0


set inccommand=nosplit
function! CycleIncCommand()
  if &inccommand == 'nosplit'
    set inccommand=split
  elseif &inccommand == 'split'
    set inccommand=
  else
    set inccommand=nosplit
  endif
endfunction

nnoremap <silent><expr> yoS CycleIncCommand()



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

" https://stackoverflow.com/questions/4668623/show-count-of-matches-in-vim#4671112
nnoremap ,c :%s/<C-R>=&ignorecase ? '\c' : '\C'<CR><C-R>///gn<CR>

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


let g:targets_nl = 'nN'


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

" TODO: Consider removing miniyank
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <Leader>y <Plug>(miniyank-cycle)
map <Leader>Y <Plug>(miniyank-cycleback)
map <Leader>c <Plug>(miniyank-tochar)
map <Leader>l <Plug>(miniyank-toline)


" Alt-R to paste buffer in terminal mode
tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'

command! -bar ReloadConfig execute 'source ' . stdpath('config') . '/init.vim'

set path+=**

nnoremap <silent> <Leader>pi :ReloadConfig <Bar> PlugInstall<CR>
nnoremap <silent> <Leader>pc :ReloadConfig <Bar> PlugClean!<CR>
nnoremap <silent> <Leader>pu :PlugUpdate<CR>
nnoremap <silent> <Leader>pU :PlugUpgrade<CR>
nnoremap <silent> <Leader>cu :CocUpdate<CR>
nnoremap <silent> <Leader>cc :CocConfig<CR>


if has('mac')
  let s:open_command = 'open'
elseif has('unix')
  let s:open_command = 'xdg-open'
else
  let s:open_command = 'start'
endif


function! SearchCommand(str, type, ...)
  echom a:str
  echom '---'
  echom a:type
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0
    let @@ = a:1
  elseif a:type == 'visual'
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif

  call system(s:open_command.' "'.a:str.@@.'"')

  let &selection = sel_save
  let @@ = reg_save
endfunction

function! DuckDuckGo(...)
  call function('SearchCommand', ['https://duckduckgo.com/?q='] + a:000)()
endfunction
command! -nargs=+ DuckDuckGo call DuckDuckGo('', '<args>')<CR>
nmap <silent> <Leader>/. :set opfunc=DuckDuckGo<CR>g@
vmap <silent> <Leader>/. :<C-U>call DuckDuckGo('visual')<CR>

function! Github(...)
  call function('SearchCommand', ['https://github.com/'] + a:000)()
endfunction
command! -nargs=+ Github call Github('', '<args>')<CR>
nmap <silent> <Leader>/g :set opfunc=Github<CR>g@
vmap <silent> <Leader>/g :<C-U>call Github('visual')<CR>

function! Dict(...)
  call function('SearchCommand', ['http://dictionary.reference.com/browse/'] + a:000)()
endfunction
command! -nargs=+ Dict call Dict('', '<args>')<CR>
nmap <silent> <Leader>/d :set opfunc=Dict<CR>g@
vmap <silent> <Leader>/d :<C-U>call Dict('visual')<CR>

function! CanIUse(...)
  call function('SearchCommand', ['https://caniuse.com/#search='] + a:000)()
endfunction
command! -nargs=+ CanIUse call CanIUse('', '<args>')<CR>
nmap <silent> <Leader>/c :set opfunc=CanIUse<CR>g@
vmap <silent> <Leader>/c :<C-U>call CanIUse('visual')<CR>

function! Wikipedia(...)
  call function('SearchCommand', ['http://en.wikipedia.org/wiki/Special:Search?search='] + a:000)()
endfunction
command! -nargs=+ Wikipedia call Wikipedia('', '<args>')<CR>
nmap <silent> <Leader>/w :set opfunc=Wikipedia<CR>g@
vmap <silent> <Leader>/w :<C-U>call Wikipedia('visual')<CR>

function! Keywordprg(word)
  if exists('*CocHasProvider') && CocHasProvider('hover')
    call CocAction('doHover')
  elseif count(['vim','help'], &filetype)
    execute 'h '.expand('<cword>')
  elseif &filetype == 'fish'
    " Fish uses a function for man, which includes more manpages. `:Man` doesn't
    " use fish's `man` by default, so use this to get manpage location
    execute 'Man ' . system('man -w ' . expand('<cword>'))
  elseif count(['shell', 'sh', 'bash', 'zsh'], &filetype)
    execute 'Man ' . expand('<cword>')
  else
    call system('search ' . a:word)
  endif
endfunction

command! -nargs=+ Keywordprg call Keywordprg('<args>')<CR>

set keywordprg=:Keywordprg


" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <A-TAB> coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


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
  " Setup formatexpr specified filetype(s).
  autocmd FileType * call <SID>setup_formatexpr()
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

function! s:setup_formatexpr()
  if exists('*CocHasProvider') && CocHasProvider('format')
    setlocal formatexpr=CocAction('formatSelected')
  endif
endfunction

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <Leader>a  <Plug>(coc-codeaction-selected)
" nmap <Leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <Leader>ac  <Plug>(coc-codeaction)

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

" This could be done in theory with some clever mappings + wellle/targets.vim,
" but Sideways' argument detection works better
nnoremap <Leader>< :SidewaysLeft<CR>
nnoremap <Leader>> :SidewaysRight<CR>
nnoremap <A-b> :SidewaysJumpLeft<CR>
nnoremap <A-w> :SidewaysJumpRight<CR>

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


augroup formatting
  autocmd! BufWritePre * call <SID>maybe_format()
augroup END

function! s:maybe_format()
  if (!exists("g:no_autoformat") || !g:no_autoformat) && exists('*CocHasProvider') && CocHasProvider("format")
    echom "Formatting…"
    call CocAction("format")
  endif
endfunction

nnoremap <silent> yof :call <SID>toggle_auto_format()<CR>

function! s:toggle_auto_format()
  if !exists('g:no_autoformat')
    let g:no_autoformat = 0
  endif
  let g:no_autoformat = !g:no_autoformat
  if g:no_autoformat
    echom "Don’t fix on save"
  else
    echom "Fix on save"
  end
endfunction


nnoremap <F8> :TagbarToggle<CR>
nnoremap <Leader>] :tag<Space>


let g:polyglot_disabled = ['cryptol', 'markdown']

augroup doc
  autocmd!
  autocmd BufReadPost *.doc,*.docx,*.odp,*.odt silent %!pandoc "%" --to=markdown -o /dev/stdout
  autocmd BufReadPost *.rtf silent %!textutil "%" -convert html -stdout | pandoc --from=html --to=markdown
augroup END

let g:tagbar_type_elm = {
    \ 'ctagstype' : 'ElmCustom',
    \ 'ctagsargs' : [ '--options='.$HOME.'/.config/ctags/', '-o-'],
    \ 'kinds'     : [
        \ 'm:Modules:0:0',
        \ 'i:Imports:0:0',
        \ 't:Types:0:0',
        \ 'a:Aliases:0:0',
        \ 'c:Constants:0:0',
        \ 'p:Ports:0:0',
        \ 'f:Functions:0:0',
        \ 'r:Records:0:0',
        \ 'y:Type constructors:0:0'
        \ ],
    \ 'sro'      : ':',
    \ 'kind2scope' : {},
    \ 'scope2kind' : {}
\ }


highlight htmlItalic cterm=italic gui=italic
highlight htmlBold cterm=bold gui=bold
highlight Comment cterm=italic gui=italic

let g:rustfmt_autosave = 1

set splitbelow splitright

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

let g:partial_templates = {} " TODO add defitions of how to break out code into partials

set list listchars=tab:▸\ ,trail:· " Show trailing tabs and spaces
set breakindent " Visually indent wrapped lines to match whitespace

" Quick way to change tab stops. Add bang to reformat file
command! -bang -nargs=1 Stab call whitespace#set(<f-args>) | call cursor#preserve(<bang>0 ? 'normal gg=G' : '')

" Spaces by default
set expandtab

" Quick way to switch between tabs and spaces
nnoremap <silent> yo<Tab> :set expandtab! <Bar> echo (&expandtab ? 'Spaces (' . &shiftwidth . ')' : 'Tabs (' . &tabstop . ')')<CR>

nnoremap <silent> yoq :call toggle#quickfixList()<CR>
nnoremap <silent> yol :call toggle#locationList()<CR>

let g:lion_squeeze_spaces = 1
nnoremap <silent> yo<Bar> :let g:lion_squeeze_spaces=(g:lion_squeeze_spaces ? 0 : 1)<CR>

" Avoid conflicting with matchit.vim (see https://github.com/jeetsukumaran/vim-indentwise/issues/6)
map [<BS> <Plug>(IndentWiseBlockScopeBoundaryBegin)
map ]<BS> <Plug>(IndentWiseBlockScopeBoundaryEnd)
