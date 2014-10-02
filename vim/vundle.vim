set runtimepath+=$HOME/.vim/bundle/Vundle.vim

filetype off
call vundle#begin()


Plugin 'gmarik/Vundle.vim'                      " Vundle must manage itself
                                                " ----------------------------------------------------------------
Plugin 'altercation/vim-colors-solarized'       " Solarized colorscheme
                                                " ----------------------------------------------------------------
Plugin 'AndrewRadev/splitjoin.vim'              " Switch between single- and multi-line code:
                                                " gS to go from single- to multi-line
                                                " gJ to go from multi- to single-line
                                                " ----------------------------------------------------------------
Plugin 'artnez/vim-wipeout'                     " Delete buffers not active in tabs/windows:
                                                " :Wipeout
                                                " ----------------------------------------------------------------
Plugin 'bkad/CamelCaseMotion'                   " `w`,`b`,`e` for camelCase and underscore_notation:
                                                " `,w`/`,b`/`,e` and `i,w`/`i,b`/`i,e`
                                                " ----------------------------------------------------------------
Plugin 'christoomey/vim-tmux-navigator'         " Lets you navigate vim panes and tmux panes with same shortcuts:
                                                " `<C-h>`/`<C-j>`/`<C-k>`/`<C-l>`
                                                " ----------------------------------------------------------------
Plugin 'vim-scripts/SearchInRange'              " `/` but for ranges:
                                                " <Leader>/
                                                " ----------------------------------------------------------------
Plugin 'kana/vim-textobj-user'                  " Create your own text objects
                                                " ----------------------------------------------------------------
Plugin 'kana/vim-textobj-indent'                " Text object for similarly indented lines
                                                " ----------------------------------------------------------------
Plugin 'gcmt/wildfire.vim'                      " Select closest text object (e.g. quotes, paragraph):
                                                " Select bigger with <Enter>, smaller with <BS>
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-jdaddy'                       " [a|i]j for dealing with JSON objects
                                                " ----------------------------------------------------------------
Plugin 'godlygeek/tabular'                      " Align text with regular expressions
                                                " ----------------------------------------------------------------
Plugin 'justinmk/vim-sneak'                     " Search for next occurence of two chars:
                                                " s<char><char> (S to go backwards)
                                                " Note: use `cl` and `cc` instead of original `s` and `S` mappings
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-unimpaired'                   " Mnemonic mappings with braces
                                                " ----------------------------------------------------------------
Plugin 'justinmk/vim-gtfo'                      " Go to file/dir in file manager/terminal:
                                                " gof: Go to the current file's directory in the File manager
                                                " got: Go to the current file's directory in the Terminal
                                                " goF: like gof for the current working directory (:pwd)
                                                " goT: like got for the current working directory (:pwd)
                                                " ----------------------------------------------------------------
Plugin 'kien/ctrlp.vim'                         " Fuzzy file finder
                                                " ----------------------------------------------------------------
Plugin 'junegunn/fzf'                           " Fuzzy file finder based on ctrlp
                                                " ----------------------------------------------------------------
Plugin 'mileszs/ack.vim'                        " Ack integration:
                                                " :Ack [options] {pattern} [{directories}]
                                                " In the quickfix window, you can use:
                                                " o    to open (same as enter)
                                                " O    to open and close quickfix window
                                                " go   to preview file (open but maintain focus on ack.vim results)
                                                " t    to open in new tab
                                                " T    to open in new tab silently
                                                " h    to open in horizontal split
                                                " H    to open in horizontal split silently
                                                " v    to open in vertical split
                                                " gv   to open in vertical split silently
                                                " q    to close the quickfix window
                                                " ----------------------------------------------------------------
Plugin 'rking/ag.vim'                           " Ag integration:
                                                " :Ag [options] {pattern} [{directory}]
                                                " In the quickfix window, you can use:
                                                " e    to open file and close the quickfix window
                                                " o    to open (same as enter)
                                                " go   to preview file (open but maintain focus on ag.vim results)
                                                " t    to open in new tab
                                                " T    to open in new tab silently
                                                " h    to open in horizontal split
                                                " H    to open in horizontal split silently
                                                " v    to open in vertical split
                                                " gv   to open in vertical split silently
                                                " q    to close the quickfix window
                                                " ----------------------------------------------------------------
Plugin 'scrooloose/nerdcommenter'               " Comment out things:
                                                " [count]<Leader>c Toggle comment
                                                " ----------------------------------------------------------------
Plugin 'scrooloose/syntastic'                   " Syntax checking with errors
                                                " ----------------------------------------------------------------
Plugin 'sheerun/vim-polyglot'                   " Syntax files for all the languages
                                                " ----------------------------------------------------------------
Plugin 'othree/javascript-libraries-syntax.vim' " Syntax for JavaScript libraries
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-rails'                        " Rails tools
                                                " ----------------------------------------------------------------
Plugin 'nelstrom/vim-markdown-folding'          " Fold markdown documents by section
                                                " ----------------------------------------------------------------
Plugin 'SirVer/ultisnips'                       " Advanced snippets
                                                " ----------------------------------------------------------------
Plugin 'honza/vim-snippets'                     " Stock snippets for Ultinips
                                                " ----------------------------------------------------------------
Plugin 'sjl/gundo.vim'                          " Visually navigate undo trees
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-abolish'                      " Substitute variations of a word:
                                                " :S/di{e,ce}/spinner{,s}/g
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-characterize'                 " Improve information given about character with `ga`
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-speeddating'                  " Make <C-a> and <C-x> work with dates
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-fugitive'                     " Wrapper for Git
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-bundler'                      " Wrapper for Ruby's Bundler:
                                                " :Bundle
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-obsession'                    " Session tracking
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-repeat'                       " Make repeat (`.`) work with more things (improve other plugins)
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-surround'                     " Deal with quotes/brackets/tags
                                                " ----------------------------------------------------------------
Plugin 'vim-scripts/matchit.zip'                " Match % to tags etc., not just braces
                                                " ----------------------------------------------------------------
Plugin 'Valloric/YouCompleteMe'                 " Code completion (needs additional install)
                                                " ----------------------------------------------------------------
Plugin 'vim-scripts/Tab-Name'                   " Easily rename tabs
                                                " :TName 'tab_page_name' - set name of tab-page
                                                " :TNoName - remove tab page name
                                                " ----------------------------------------------------------------
Plugin 'zoeesilcock/vim-caniuse'                " Easily access CanIUse documentation:
                                                " <Leader>ciu
                                                " :Caniuse <search>

" Mac-specific plugins
if has('mac')
  Plugin 'rizzatti/dash.vim' " :Dash.app integration
endif

" TO CHECK OUT PROPERLY BEFORE INSTALLING AGAIN SO I ACTUALLY USE THEM THIS TIME
" Plugin 'FredKSchott/CoVim'
" Plugin 'jgdavey/vim-turbux'
" Plugin 'benmills/vimux'     " Open small tmux pane to execute a command:
"                             " :VimuxRunCommand
"                             " :VimuxRunLastCommand
" Plugin 'jgdavey/tslime.vim' " Send commands to tmux:
"                             " :Tmux <command here>
" Plugin 'tpope/vim-tbone'


call vundle#end()
filetype plugin indent on
