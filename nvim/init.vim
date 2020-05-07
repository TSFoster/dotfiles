call plug#begin(stdpath('config') . '/plugged')

Plug 'tpope/vim-characterize'

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
set relativenumber
augroup numbering
  autocmd!
  autocmd TermOpen * set nonumber
augroup END

" Use smart case sensitivity in searches
set ignorecase
set smartcase

" Stop wrapping searches around end of file
set nowrapscan

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
function! Preserve(command)
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


let g:python_host_prog = substitute(system('which python2'),'\n','','g')
let g:python3_host_prog = substitute(system('which python3'),'\n','','g')


set statusline=%{SetStatusColorsByMode(mode())}%1* " Hack(?) to change statusbar color based on mode
set statusline+=\%{CocStatus()}                    " coc.nvim
set statusline+=\ %<%F                             " File path
set statusline+=\%{CurrentFunction()}              " coc.nvim
set statusline+=\ [%n]                             " Buffer number
set statusline+=\ %y                               " File type
set statusline+=\ %m%r%w                           " Modified? Read-only? Preview?
set statusline+=%=                                 " ------------------------------
set statusline+=\ [(%l:%v)/%L]                     " Row:col number/total lines (%)
set statusline+=\ [%{''.(&fenc!=''?&fenc:&enc).''} " File encoding
set statusline+=\%{(&bomb?\",\ BOM\":\"\")}        " Byte order mark
set statusline+=\%{(&paste?\",\ PASTE\":\"\")}]    " Paste mode
set statusline+=\ [%{&spelllang}]                  " Language
set statusline+=\ [%{mode()}]                      " Mode

set noshowmode  " This is covered by the statusline now

function! CocStatus()
  if !exists('*coc#status') || coc#status() == ''
    return ''
  endif
  return ' [' . coc#status() . ']'
endfunction

function! CurrentFunction()
  let cf = get(b:, 'coc_current_function', '')
  if cf == ''
    return ''
  endif
  return ':' . cf . ''
endfunction

function! SetStatusColorsByMode(mode)
  if a:mode=='n' || a:mode=='no'
    highlight! link User1 StatusLineNormal
  elseif a:mode=='i'
    highlight! link User1 StatusLineInsert
  elseif a:mode=='v' || a:mode=='V' || a:mode==''
    highlight! link User1 StatusLineVisual
  elseif a:mode=='t'
    highlight! link User1 StatusLineTerm
  else
    highlight! link User1 StatusLine
  endif
  return ''
endfunction


function! SetTitlestring(...)
  set title
  if &buftype == 'terminal'
    let &titlestring = b:term_title
  else
    let cwd = getcwd()
    let fp = expand('%:p')
    if fp == '' || fp =~? '^'.$VIMRUNTIME
      let &titlestring = cwd
    else
      let &titlestring = fp
    end
  end
endfunction

let s:timerid = 0
function! WatchForTermTitle()
  if s:timerid > 0
    call timer_stop(s:timerid)
    let s:timerid = 0
  end
  if &buftype == 'terminal'
    let s:timerid = timer_start(5000, 'SetTitlestring', {'repeat': -1})
  end
endfunction

function! StopWatchingForTermTitle()
  if s:timerid > 0
    call timer_stop(s:timerid)
    let s:timerid = 0
  end
endfunction

set t_ts=k
set t_fs=\

augroup titlebar_naming
  autocmd!
  autocmd VimLeave * :set t_ts=k\
  autocmd BufEnter * :call SetTitlestring()
  autocmd BufEnter * :call WatchForTermTitle()
  autocmd BufLeave * :call StopWatchingForTermTitle()
augroup end


let g:colors_name = 'base16-strange_harmony'

function! SetLight()
  set background=light
endfunction

function! SetDark()
  set background=dark
endfunction

command! SetDark call SetDark()
command! SetLight call SetLight()

if join(readfile($dataDir . "/dark_mode")) == "true"
  SetDark
else
  SetLight
endif

function! ReverseBackground()
  if &background=="light"
    SetDark
  else
    SetLight
  endif
endfunction

command! ReverseBackground call ReverseBackground()

nnoremap <silent> <F11> :ReverseBackground<CR>


Plug 'artnez/vim-wipeout'
Plug 'tpope/vim-eunuch'
Plug 'dbmrq/vim-dialect'

set spelllang=en_gb

Plug 'fcpg/vim-kickfix'
let g:kickfix_zebra=0


Plug 'tpope/vim-vinegar'

let g:netrw_preview=1 " Vertical preview

Plug 'lambdalisue/suda.vim'
cmap w!! w suda://%

Plug 'jbgutierrez/vim-partial'
let g:partial_templates={}


Plug 'mbbill/undotree'
nnoremap <silent> <F5> :UndotreeToggle<CR>
let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 1
let g:undotree_SetFocusWhenToggle = 0

set undofile                             " Store undos in a file
set undolevels=1000                      " Maximum number of changes that can be undone
set undoreload=10000                     " Maximum number lines to save for undo on a buffer reload
set viminfo='1000,f1,<500                " Keep marks for 1000 files, store global marks, limit viminfo to 500 lines


Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-syntax'
Plug 'lucapette/vim-textobj-underscore'
Plug 'reedes/vim-textobj-quote'
Plug 'glts/vim-textobj-comment'
Plug 'wellle/targets.vim'

Plug 'machakann/vim-swap'
let g:swap_no_default_key_mappings = 1
nmap g<Left> <Plug>(swap-prev)
nmap g<Right> <Plug>(swap-next)
nmap gs <Plug>(swap-interactive)

Plug 'bkad/CamelCaseMotion'
map <silent> \w <Plug>CamelCaseMotion_w
map <silent> \b <Plug>CamelCaseMotion_b
map <silent> \e <Plug>CamelCaseMotion_e
map <silent> \ge <Plug>CamelCaseMotion_ge


Plug 'tpope/vim-abolish'

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

" Follows vim-unimpaired’s *c*hange *o*ption format
nmap <silent><expr> coS CycleIncCommand()


Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'jeetsukumaran/vim-indentwise'

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

nnoremap <silent> <Leader>w :update<CR>
nnoremap <silent> <Leader>W :wa<CR>

" Common substitution patterns, accessible with one button press (on a Mac
" keyboard, at least)
nmap § :%s//g<LEFT><LEFT>
vmap § :s//g<LEFT><LEFT>


nnoremap <silent> <q :<c-u>for _ in range(v:count1) \| colder \| endfor<CR>
nnoremap <silent> >q :<c-u>for _ in range(v:count1) \| cnewer \| endfor<CR>
nnoremap <silent> <l :<c-u>for _ in range(v:count1) \| lolder \| endfor<CR>
nnoremap <silent> >l :<c-u>for _ in range(v:count1) \| lnewer \| endfor<CR>
nnoremap <silent> <Q :try \| while 1 > 0 \| silent colder \| endwhile \| catch // \| endtry<CR>
nnoremap <silent> >Q :try \| while 1 > 0 \| silent cnewer \| endwhile \| catch // \| endtry<CR>
nnoremap <silent> <L :try \| while 1 > 0 \| silent lolder \| endwhile \| catch // \| endtry<CR>
nnoremap <silent> >L :try \| while 1 > 0 \| silent lnewer \| endwhile \| catch // \| endtry<CR>


function! HelpToggle()
  let helpIsOpen = 0
  let currentWindow = 0
  while (winbufnr(currentWindow) > -1)
    if (getbufvar(winbufnr(currentWindow), '&buftype') ==# 'help')
      let helpIsOpen = 1
      break
    endif
    let currentWindow += 1
  endwhile
  if helpIsOpen
    helpclose
  elseif &ft == 'vim'
    execute 'help ' . expand('<cword>')
  else
    Helptags
  endi
endfunction

nnoremap <silent> <Leader>? :call HelpToggle()<CR>

" When using CTRL-C key to leave insert mode, it does not trigger the autocmd InsertLeave
inoremap <c-c> <ESC>

" Map C-z to M-z to allow detaching from abduco within abduco nvim
tnoremap <M-z> <C-z>


" Convert bases. This overrides builtin gh (select mode), but I never use that.
nnoremap <silent> gh ciw<C-r>=printf('0x%x', <C-r>")<CR><Esc>


Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'junegunn/gv.vim'

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

function! CreateFile(path)
  if type(a:path) == v:t_dict
    if a:path["name"] == "files"
      call CreateFile(a:path["targets"])
    else
      return
    end
  elseif type(a:path) == v:t_list
    for i in a:path
      call CreateFile(i.location.uri)
    endfor
  else
    let filename = input('Enter filename: ')
    let fullpath = fnamemodify(a:path, ':p:h') . '/' . filename
    execute "normal \<Esc>:edit " . fullpath . "\<CR>"
  endif
endfunction

function! PopulateArgs(ctx)
  let paths = map(a:ctx["targets"], 'v:val["location"]["uri"]')
  execute "normal \<Esc>:args " . join(paths, ' ') . "\<CR>"
endfunction


if executable('rg')
  set grepprg=rg\ --vimgrep
endif
nnoremap <Leader>a :silent! grep<Space>
nnoremap <Leader>A :silent! grepadd<Space>
nnoremap <Leader><Leader>a :silent! lgrep<Space>
nnoremap <Leader><Leader>A :silent! lgrepadd<Space>


Plug 'machakann/vim-highlightedyank'

Plug 'bfredl/nvim-miniyank'
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <Leader>y <Plug>(miniyank-cycle)

" Alt-R to paste buffer in terminal mode
tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'


Plug 'tpope/vim-dadbod'


command! -bar RefreshRC execute 'source ' . stdpath('config') . '/init.vim'

nnoremap <silent> <Leader>rc :RefreshRC<CR>
nnoremap <silent> <Leader>pi :RefreshRC \| PlugInstall<CR>
nnoremap <silent> <Leader>pc :RefreshRC \| PlugClean!<CR>
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

function! Wikipedia(...)
  call function('SearchCommand', ['http://en.wikipedia.org/wiki/Special:Search?search='] + a:000)()
endfunction
command! -nargs=+ Wikipedia call Wikipedia('', '<args>')<CR>
nmap <silent> <Leader>/w :set opfunc=Wikipedia<CR>g@
vmap <silent> <Leader>/w :<C-U>call Wikipedia('visual')<CR>


Plug 'zoeesilcock/vim-caniuse'

if has('mac')
  Plug 'rizzatti/dash.vim'
endif

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


Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
nmap <Leader>rn <Plug>(coc-rename)

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

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)


Plug 'honza/vim-snippets'

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

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


Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
nnoremap <F8> :TagbarToggle<CR>

nnoremap <Leader>] :tag<Space>


let g:polyglot_disabled = ['cryptol', 'markdown']


Plug 'ap/vim-css-color'
Plug 'amadeus/vim-convert-color-to'


Plug 'chrisbra/csv.vim'


augroup doc
  autocmd!
  autocmd BufReadPost *.doc,*.docx,*.odp,*.odt silent %!pandoc "%" --to=markdown -o /dev/stdout
  autocmd BufReadPost *.rtf silent %!textutil "%" -convert html -stdout | pandoc --from=html --to=markdown
augroup END


Plug 'slashmili/alchemist.vim'


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


Plug 'mattn/emmet-vim'

Plug 'mogelbrod/vim-jsonpath'


if has('mac') && isdirectory("/Applications/Marked 2.app")
  Plug 'itspriddle/vim-marked', { 'for': ['markdown'] }
endif

highlight htmlItalic cterm=italic gui=italic
highlight htmlBold cterm=bold gui=bold
highlight Comment cterm=italic gui=italic


let g:rustfmt_autosave = 1

Plug 'itspriddle/vim-shellcheck'
Plug 'tpope/vim-scriptease'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'neoclide/coc-neco'
Plug 'sheerun/vim-polyglot'
Plug 'wellle/visual-split.vim'

set splitbelow
set splitright

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

nnoremap <A-w> :Windows<CR>
tnoremap <A-w> <C-\><C-n>:Windows<CR>

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


Plug 'editorconfig/editorconfig-vim'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-sleuth'

let g:lion_squeeze_spaces = 1
nnoremap <silent> <Leader>gl :let g:lion_squeeze_spaces=(g:lion_squeeze_spaces ? 0 : 1)<CR>

set listchars=tab:▸\ ,trail:· " Show trailing tabs and spaces
set list                      " Display whitespace
set breakindent               " Visually indent wrapped lines to match whitespace

" Set all the tab stops to the same value
function! SetTab(tabstop)
  if a:tabstop > 0
    let &l:softtabstop = a:tabstop
    let &l:tabstop = a:tabstop
    let &l:shiftwidth = a:tabstop
  endif
endfunction

" Quick way to change tab stops. Add bang to reformat file
command! -bang -nargs=1 Stab call SetTab(<f-args>) | call Preserve(<bang>0 ? 'normal gg=G' : '')

" Spaces by default
set expandtab
" Quick way to switch between tabs and spaces
command! Tabs set noexpandtab
command! Spaces set expandtab


Plug 'tpope/vim-commentary'

call plug#end()

" Toggle list windows
" Adapted from https://github.com/tpope/vim-unimpaired/issues/97#issuecomment-371219365

function! QuickFix_toggle()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor
  copen
endfunction


function! s:BufferCount() abort
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction
function! Location_toggle()
  " https://github.com/Valloric/ListToggle/blob/master/plugin/listtoggle.vim
  let buffer_count_before = s:BufferCount()

  " Location list can't be closed if there's cursor in it, so we need
  " to call lclose twice to move cursor to the main pane
  silent! lclose
  silent! lclose

  if s:BufferCount() == buffer_count_before
    silent! lopen
    if s:BufferCount() == buffer_count_before
      echo 'No items in location list'
    endif
  endif
endfunction

" These have to be put after plug#end to ensure that they override unimpaired mappings
nnoremap <silent> yoq :call QuickFix_toggle()<CR>
nnoremap <silent> yol :call Location_toggle()<CR>

" vim: tabstop=2 softtabstop=2 shiftwidth=2
