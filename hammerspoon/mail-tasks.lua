function check_for_tasks()
    hs.execute('/Users/toby/.dotfiles/bin/process_mailboxes')
end
hs.timer.doEvery(3 * 60, check_for_tasks)
