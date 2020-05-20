call plug#begin(stdpath('config') . '/plugged')

Plug 'bkad/CamelCaseMotion'
Plug 'dbmrq/vim-dialect'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'itspriddle/vim-shellcheck'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'ludovicchabant/vim-gutentags'
Plug 'machakann/vim-swap'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'wellle/visual-split.vim'

" Textobjects
Plug 'wellle/targets.vim'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-quote'

" TODO investigate https://github.com/tracyone/neomake-multiprocess and https://github.com/neomake/neomake
" TODO investigate https://github.com/coachshea/neo-pipe
" TODO investigate https://github.com/tpope/vim-projectionist

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
set number relativenumber
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


" Run a command and return cursor (and last search) to original position
function! PreserveCursor(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

command! -nargs=1 PreserveCursor call PreserveCursor(<f-args>)


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

" Swap visual and visual block modes. Visual block more commonly used by me
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

" %% in command line maps to current file's directory
cnoremap <expr> %% fnameescape(expand('%:h').'/')
" %p in command line maps to current file's path
cnoremap <expr> %p fnameescape(expand('%:p'))
" %p in command line maps to current file's relative path
cnoremap <expr> %r fnameescape(expand('%'))

function! Quit()
  if (winnr('$') == 1 && tabpagenr('$') == 1)
    if confirm('Are you sure you want to quit?', "&Yes\n&No", 2, "Question") == 1
      quit
    endif
  else
    quit
  endif
endfunction

nnoremap <silent> <Leader>q :call Quit()<CR>
nnoremap <silent> <Leader><Leader>q :xa<CR>

function! Update()
  try
    update
  catch /E212/
    if confirm('Directory doesn’t exist, should it be created?', "&Yes\n&No", 2, "question") == 1
      silent !mkdir -p %:h
      write
    endif
  endtry
endfunction

nnoremap <silent> <Leader>w :call Update()<CR>
nnoremap <silent> <Leader>W :wa<CR>

" Common substitution patterns, accessible with one button press (on a Mac
" keyboard, at least)
nmap § :%s//g<LEFT><LEFT>
vmap § :s//g<LEFT><LEFT>

" https://stackoverflow.com/questions/4668623/show-count-of-matches-in-vim#4671112
nnoremap ,c :%s/<C-R>=&ignorecase ? '\c' : '\C'<CR><C-R>///gn<CR>

nnoremap <silent> <q :<c-u>for _ in range(v:count1) \| colder \| endfor<CR>
nnoremap <silent> >q :<c-u>for _ in range(v:count1) \| cnewer \| endfor<CR>
nnoremap <silent> <l :<c-u>for _ in range(v:count1) \| lolder \| endfor<CR>
nnoremap <silent> >l :<c-u>for _ in range(v:count1) \| lnewer \| endfor<CR>
nnoremap <silent> <Q :try \| while 1 > 0 \| silent colder \| endwhile \| catch // \| endtry<CR>
nnoremap <silent> >Q :try \| while 1 > 0 \| silent cnewer \| endwhile \| catch // \| endtry<CR>
nnoremap <silent> <L :try \| while 1 > 0 \| silent lolder \| endwhile \| catch // \| endtry<CR>
nnoremap <silent> >L :try \| while 1 > 0 \| silent lnewer \| endwhile \| catch // \| endtry<CR>


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

nnoremap <silent> <Leader>pi :ReloadConfig \| PlugInstall<CR>
nnoremap <silent> <Leader>pc :ReloadConfig \| PlugClean!<CR>
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

" Mappings for argument text object
omap <silent> aa <Plug>SidewaysArgumentTextobjA
xmap <silent> aa <Plug>SidewaysArgumentTextobjA
omap <silent> ia <Plug>SidewaysArgumentTextobjI
xmap <silent> ia <Plug>SidewaysArgumentTextobjI

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

let g:lion_squeeze_spaces = 1
nnoremap <silent> <Leader>gl :let g:lion_squeeze_spaces=(g:lion_squeeze_spaces ? 0 : 1)<CR>

set list listchars=tab:▸\ ,trail:· " Show trailing tabs and spaces
set breakindent " Visually indent wrapped lines to match whitespace

" Set all the tab stops to the same value
function! SetTab(tabstop)
  if a:tabstop > 0
    let &l:softtabstop = a:tabstop
    let &l:tabstop = a:tabstop
    let &l:shiftwidth = a:tabstop
  endif
endfunction

" Quick way to change tab stops. Add bang to reformat file
command! -bang -nargs=1 Stab call SetTab(<f-args>) | call PreserveCursor(<bang>0 ? 'normal gg=G' : '')

" Spaces by default
set expandtab

" Quick way to switch between tabs and spaces
nnoremap <silent> yo<Tab> :set expandtab! \| echo (&expandtab ? 'Spaces (' . &shiftwidth . ')' : 'Tabs (' . &tabstop . ')')<CR>

nnoremap <silent> yoq :call toggle#quickfixList()<CR>
nnoremap <silent> yol :call toggle#locationList()<CR>

" vim: tabstop=2 softtabstop=2 shiftwidth=2
