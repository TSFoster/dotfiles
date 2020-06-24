status --is-interactive; or exit

abbr --add --global 1pp 1pass -p

abbr --add --global abd abduco

abbr --add --global an ansible
abbr --add --global ap ansible-playbook

abbr --add --global calc command dc

abbr --add --global d docker
abbr --add --global dm docker-machine
abbr --add --global dsw docker swarm
abbr --add --global ds docker service
abbr --add --global dc docker-compose

abbr --add --global dbu dropbox_uploader.sh -f ~/.config/dropbox_uploader

abbr --add --global g git
abbr --add --global gca git commit --amend
abbr --add --global gcane git commit --amend --no-edit
abbr --add --global gd git diff
abbr --add --global gdc git diff --cached
abbr --add --global gst git stash
abbr --add --global gsp git stash pop
abbr --add --global gs git status

abbr --add --global l ls
abbr --add --global la ls -A
abbr --add --global ll ls -l

abbr --add --global psg psgrep

abbr --add --global .. pushd ..
abbr --add --global ~ pushd ~
abbr --add --global cd pushd
abbr --add --global -- - popd

abbr --add --global v "$EDITOR"
abbr --add --global vp vimpack

set --query NVIM_LISTEN_ADDRESS
and abbr --add --global e nvr
and not set --query COLORTERM # for some reason $COLORTERM is not set in nvim term://
and abbr --add --global man viman
