status --is-interactive; or exit

if [ -z "$SSH_AGENT_PID" -o -z "$SSH_AUTH_SOCK" ]; or echo (ssh-add -l ^&1) | grep -q "Error connecting to agent"
    fkill ssh-agent ^ /dev/null

    set -q SSH_AGENT_PID; and set -e SSH_AGENT_PID
    set -q SSH_AUTH_SOCK; and set -e SSH_AUTH_SOCK

    eval (ssh-agent -c | sed 's/^echo/#echo/' | sed 's/setenv/set -U/')

    chmod 600 $SSH_AUTH_SOCK
end

ssh-add -A ^ /dev/null
