# Display vi mode on right
function zle-line-init zle-keymap-select {
  RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/}"
  RPS2=$RPS1
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git cvs hg svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '(%b)%F{yellow}%c%u%m%f '
zstyle ':vcs_info:*' stagedstr '⁺'
zstyle ':vcs_info:*' unstagedstr '°'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
precmd() {
  vcs_info
}

+vi-git-untracked(){
     if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
         git status --porcelain | grep '??' &> /dev/null ; then
         hook_com[staged]+='ˀ'
     fi
 }

# PS1
PROMPT='%F{blue}%c %F{cyan}${vcs_info_msg_0_}%F{red}%(!.».→) %f'
PROMPT2='%F{black}%c ${vcs_info_msg_0_}%F{green}%(!.».→) %f'
if [ -n "$isSSH" ] && [ -n "$machineName" ]; then
  PROMPT="%F{yellow}$machineName ⊧%f $PROMPT";
fi
