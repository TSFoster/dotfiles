CLICOLOR=1
LSCOLORS=gxfxcxdxbxegedabagacad
TERM=xterm-256color-italic

# Free up <C-s> <C-q> from flow control
stty -ixon

setopt AUTO_CD            # No need to type cd
setopt MULTIOS            # Pipe to multiple outputs
setopt CORRECT            # Spell check commands
setopt AUTO_PUSHD         # pushd insted of cd
setopt AUTO_NAME_DIRS     # Use named dirs when possible
setopt PUSHDIGNOREDUPS    # Don't duplicate directories in stack
setopt EXTENDED_GLOB      # GLOBBING!
setopt NULL_GLOB          # Match *.nomatches to nothing, not literal
setopt PUSHD_SILENT       # No more annoying pushd messages
setopt PUSHD_TO_HOME      # Blank pushd goes to home
setopt PUSHD_IGNORE_DUPS  # Ignore multiple directories for the stack
setopt RM_STAR_WAIT       # 10 second wait before deleting everything
setopt ZLE                # Magic
setopt NO_HUP             # Don't kill background processes
setopt VI && bindkey -v   # Vi mode
setopt COMPLETEINWORD     # Tab completion from both ends
setopt PROMPT_SUBST       # Prompt expansion
setopt INC_APPEND_HISTORY # Save history as soon as command is executed
setopt SHARE_HISTORY      # Share history

# Keyboard Shortcuts
bindkey '^O' clear-screen                                         # Clear screen shortcut
bindkey -M vicmd '/' history-incremental-pattern-search-backward  # Pattern search in normal mode
bindkey -M vicmd '?' history-incremental-pattern-search-forward   # Forward pattern search in normal mode
bindkey -M viins '^R' history-incremental-pattern-search-backward # Pattern search in insert mode
bindkey -M viins '^F' history-incremental-pattern-search-forward  # Forward pattern search in insert mode
bindkey '^N' menu-complete                                        # Vim bindings for cycling…
bindkey '^P' reverse-menu-complete                                # …through completions
bindkey '^[[Z' reverse-menu-complete                              # Shift-tab to reverse through completions
bindkey '^[[A' up-line-or-search                                  # History completion up
bindkey '^[[B' down-line-or-search                                # History completion down
bindkey '^W' up-line-or-search                                    # History completion up
bindkey '^S' down-line-or-search                                  # History completion down
bindkey -M vicmd 'gg' beginning-of-history                        # beggining of history
bindkey -M vicmd 'G' end-of-history                               # end of history
bindkey jj vi-cmd-mode                                            # Map jj to escape

# Alt-m/. to insert previous first/last words
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[m" copy-earlier-word # e.g. `ls lib` `<alt-m> dist`
bindkey '\e.' insert-last-word  # e.g. `mkdir something<CR>`, `cd <alt-.><CR>`

# Edit command in $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
