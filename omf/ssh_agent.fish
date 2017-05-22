if [ -z "$SSH_AGENT_PID" -o -z "$SSH_AUTH_SOCK" ]; or echo (ssh-add -l ^&1) | grep -q "Error connecting to agent"
    fkill ssh-agent ^ /dev/null

    set -q SSH_AGENT_PID; and set -e SSH_AGENT_PID
    set -q SSH_AUTH_SOCK; and set -e SSH_AUTH_SOCK

    eval (ssh-agent -c | sed 's/^echo/#echo/' | sed 's/setenv/set -U/')

    chmod 600 $SSH_AUTH_SOCK
end

set ssh_keys_already_added (ssh-add -l | sed -E 's/^.* (\/.+) .+$/\1/')
for key in (ls ~/.ssh/id* | grep -v '\.pub')
    not contains $key $ssh_keys_already_added
        and ssh-add $key ^ /dev/null
end
set -e ssh_keys_already_added
