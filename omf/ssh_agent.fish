status --is-interactive; or exit

command -s fkill > /dev/null; or exit
command -s ssh-agent > /dev/null; or exit
command -s ssh-add > /dev/null; or exit

if [ -z "$SSH_AGENT_PID" -o -z "$SSH_AUTH_SOCK" ]; or echo (ssh-add -l 2>&1) | grep -q "Error connecting to agent"
    fkill ssh-agent 2> /dev/null

    set -q SSH_AGENT_PID; and set -e SSH_AGENT_PID
    set -q SSH_AUTH_SOCK; and set -e SSH_AUTH_SOCK

    eval (ssh-agent -c | sed 's/^echo/#echo/' | sed 's/setenv/set -U/')

    chmod 600 $SSH_AUTH_SOCK
end

ssh-add -A 2> /dev/null
