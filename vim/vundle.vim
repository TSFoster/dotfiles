set runtimepath+=$HOME/.vim/bundle/Vundle.vim

filetype off
call vundle#begin()

                                                " ================================================================
Plugin 'gmarik/Vundle.vim'                      " Vundle must manage itself
                                                " ----------------------------------------------------------------
Plugin 'chriskempson/base16-vim'                " base15 colorschemechriskempson/base16-vim
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
Plugin 'ashisha/image.vim'                      " Image viewer for vim, requires `pip install Pillow`
                                                " ----------------------------------------------------------------
Plugin 'kana/vim-textobj-user'                  " Create your own text objects
                                                " ----------------------------------------------------------------
Plugin 'kana/vim-textobj-indent'                " Text object for similarly indented lines
                                                " ----------------------------------------------------------------
Plugin 'kana/vim-textobj-entire'                " Text object for entire text
                                                " ----------------------------------------------------------------
Plugin 'reedes/vim-textobj-quote'               " Text object for smart quotes
                                                " ----------------------------------------------------------------
Plugin 'reedes/vim-wordy'                       " Functions to help you write better (`:Wordy`, `:NoWordy`)
                                                " ----------------------------------------------------------------
Plugin 'gcmt/wildfire.vim'                      " Select closest text object (e.g. quotes, paragraph):
                                                " Select bigger with <Enter>, smaller with <BS>
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-jdaddy'                       " {a,i}j for dealing with JSON objects
                                                " ----------------------------------------------------------------
Plugin 'glts/vim-textobj-comment'               " Comment text objects {i,a}{c,C}
                                                " ----------------------------------------------------------------
Plugin 'godlygeek/tabular'                      " Align text with regular expressions
                                                " ----------------------------------------------------------------
Plugin 'tommcdo/vim-lion'                       " Align text with a motion and a single character:
                                                " g{l,L}<motion><char>
                                                " ----------------------------------------------------------------
Plugin 'justinmk/vim-sneak'                     " Search for next occurence of two chars:
                                                " s<char><char> (S to go backwards)
                                                " Note: use `cl` and `cc` instead of original `s` and `S` mappings
                                                " ----------------------------------------------------------------
Plugin 'haya14busa/incsearch.vim'               " Improve incsearch
                                                " See :h incsearch.txt
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-unimpaired'                   " Mnemonic mappings with braces
                                                " ----------------------------------------------------------------
Plugin 'jeetsukumaran/vim-indentwise'           " Paired mappings for motions based on indent
                                                " {[,]}{-,+,=,%} previous/next lesser/greater/same/block indent
                                                " ----------------------------------------------------------------
Plugin 'justinmk/vim-gtfo'                      " Go to file/dir in file manager/terminal:
                                                " gof: Go to the current file's directory in the File manager
                                                " got: Go to the current file's directory in the Terminal
                                                " goF: like gof for the current working directory (:pwd)
                                                " goT: like got for the current working directory (:pwd)
                                                " ----------------------------------------------------------------
Plugin 'ctrlpvim/ctrlp.vim'                     " Fuzzy file finder
                                                " ----------------------------------------------------------------
Plugin 'd11wtq/ctrlp_bdelete.vim'               " Ctrlp plugin to delete buffers with <C-2>
                                                " ----------------------------------------------------------------
Plugin 'tacahiroy/ctrlp-funky'                  " Ctrlp plugin to search functions
                                                " <Leader>fu: Search functions
                                                " <Leader>fU: Search functions like word under cursor
                                                " ----------------------------------------------------------------
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
Plugin 'Wolfy87/vim-expand'                     " :Expand selected text
                                                " ----------------------------------------------------------------
Plugin 'scrooloose/syntastic'                   " Syntax checking with errors
                                                " ----------------------------------------------------------------
Plugin 'sheerun/vim-polyglot'                   " Syntax files for all the languages
                                                " ----------------------------------------------------------------
Plugin 'othree/javascript-libraries-syntax.vim' " Syntax for JavaScript libraries
                                                " ----------------------------------------------------------------
Plugin 'kien/rainbow_parentheses.vim'           " Different colors for pairs of parentheses
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-rails'                        " Rails tools
                                                " ----------------------------------------------------------------
Plugin 'nelstrom/vim-markdown-folding'          " Fold markdown documents by section
                                                " ----------------------------------------------------------------
Plugin 'suan/vim-instant-markdown'              " Instant browser preview of markdown files
                                                " :InstantMarkdownPreview
                                                " N.B. Must install pygments.rb and redcarpet gems,
                                                " and install instant-markdown-d node module globally
                                                " ----------------------------------------------------------------
Plugin 'SirVer/ultisnips'                       " Advanced snippets
                                                " ----------------------------------------------------------------
Plugin 'honza/vim-snippets'                     " Stock snippets for Ultinips
                                                " ----------------------------------------------------------------
Plugin 'majutsushi/tagbar'                      " Class outline viewer for Vim
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
Plugin 'airblade/vim-gitgutter'                 " Shows git diff in gutter
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-fugitive'                     " Wrapper for Git
                                                " ----------------------------------------------------------------
Plugin 'mattn/gist-vim'                         " Post gists with :Gist (-p for private, -P for public)
                                                " ----------------------------------------------------------------
Plugin 'mattn/webapi-vim'                       " Required for gist-vim
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
Plugin 'Shougo/neocomplete.vim'                 " Code completion
                                                " ----------------------------------------------------------------
Plugin 'zoeesilcock/vim-caniuse'                " Easily access CanIUse documentation:
                                                " :Caniuse <search>
                                                " ================================================================
                                                " Filesystem plugins {{{
                                                " ----------------------------------------------------------------
Plugin 'c0r73x/vimdir.vim'                      " Buffer-based file management
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-vinegar'                      " Improve netrw
                                                " }}} ============================================================
                                                " Tmux plugins {{{
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-tbone'                        " Send and receive text with tmux:
                                                " :Tyank, :Twrite, :Tmux
                                                " ----------------------------------------------------------------
Plugin 'jgdavey/vim-turbux'                     " Ruby testing with tmux
                                                " ----------------------------------------------------------------
Plugin 'tpope/vim-dispatch'                     " Open Tmux (or other) window
                                                " `:Dispatch [command]` (or b:dispatch)
                                                " `:Focus global command` (:Focus! to turn off)
                                                " `:Start command` for interactive shell (:Start! for background)
                                                " ----------------------------------------------------------------
Plugin 'manicmaniac/betterga'                   " More info when you type `ga`
                                                " ----------------------------------------------------------------
Plugin 'editorconfig/editorconfig-vim'          " Editorconfig support
                                                " ----------------------------------------------------------------
Plugin 'FredKSchott/CoVim'                      " “Think Google Docs for Vim”:
                                                " `:CoVim start [port] [name]`
                                                " `:CoVim connect [host address / 'localhost'] [port] [name]`
                                                " `:CoVim disconnect`
                                                " `:CoVim quit`
                                                " }}} ============================================================
if has('mac')                                   " Mac-specific plugins {{{
                                                " ----------------------------------------------------------------
  Plugin 'rizzatti/dash.vim'                    " :Dash.app integration
endif                                           " }}} =============================================================

call vundle#end()
filetype plugin indent on
