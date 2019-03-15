function processMailbox(name, onlyFlagged, toDoType)
    local flaggedStatus = ''
    if onlyFlagged then flaggedStatus = ', {flaggedStatus: true}' end

    local code = [[
        (function processMailboxes(app) {
            var Mail = app('Mail');
            var Things = app('Things');

            if (!Mail.running() || !Things.running()) return;

            var mailboxes = Mail.accounts.byName('Strange Bureau').mailboxes;
            var archiveMailbox = mailboxes.byName('In Things');
            var thingsInbox = Things.lists.byName('Inbox');

            getMessagesIn(']] .. name .. "'" .. flaggedStatus .. [[)()
                .map(init)
                .map(]] .. toDoType .. [[)
                .map(addToDosToInbox)
                .map(archiveMessage);

            function init(message) {
                return {
                    message: message,
                    toDos: [],
                };
            }

            function waitingToDo(model) {
                const name = isSelf(model.message.sender())
                    ? thirdParties(model.message) + ' replied?'
                    : 'Waiting on ' + thirdParties(model.message);
                return addToDo(model, {
                    name: name,
                    notes: makeNote(model.message),
                    tagNames: ['@Waiting'],
                });
            }

            function replyToDo(model) {
                return addToDo(model, {
                    name: 'Reply to ' + thirdParties(model.message),
                    notes: makeNote(model.message),
                    tagNames: ['Correspondence'],
                });
            }

            function actionToDo(model) {
                return addToDo(model, {
                    name: 'Action email ‘' + model.message.subject() + '’',
                    notes: makeNote(model.message),
                });
            }

            function addToDo(model, toDo) {
                model.toDos.push(toDo);
                return model;
            }

            function thirdParties(message) {
                if (isSelf(message.sender())) return extractNames(message.recipients());
                return extractName(message.sender());
            }

            function isSelf(sender) {
                return /Toby Foster|<.*toby.*(millk|strangebureau|efex|tsf|mor-far)>/.test(sender);
            }

            function extractNames(recipients) {
                return recipients.map(getName).join(', ');
            }

            function extractName(sender) {
                var match = sender.match(/((.*) )?<(.*)>/);
                return match[2] || match[3];
            }

            function makeNote(message) {
                const recipients = message.recipients().map(getFullName).join(', ');
                return `
                    From: ${message.sender()}
                    To: ${recipients}
                    Subject: ${message.subject()}
                    Message ID: ${message.id()}

                    message://${encodeURIComponent('<' + message.messageId() + '>')}
                `.trim().replace(/\n\t+/g,'\n');
            }

            function getName(recipient) {
                var name = recipient.name();
                if (name && name.length > 0) return name;
                return recipient.address();
            }

            function getFullName(recipient) {
                return recipient.name() + ' <' + recipient.address() + '>';
            }

            function addToDosToInbox(model) {
                model.toDos.forEach(addToDoToInbox);
                return model;
            }

            function addToDoToInbox(toDo) {
                thingsInbox.toDos.push(Things.ToDo(toDo));
            }

            function archiveMessage(model) {
                model.message.flaggedStatus = false;
                Mail.move(model.message, {to: archiveMailbox});
                return model;
            }

            function getMessagesIn(mailboxName, extraConditions = {}) {
                const conditions = Object.assign({
                    deletedStatus: false,
                }, extraConditions);
                return mailboxes.byName(mailboxName).messages.where(conditions);
            }
        })(Application);
    ]]

    return function()
        hs.osascript.javascript(code)
    end
end

function processMailboxWatcher(box, flaggedOnly, action)
    local path = homePath('Library/Mail')
    if not path then return nil end
    local fn = processMailbox(box, flaggedOnly, action)
    hs.pathwatcher.new(path, fn):start()
    fn()
end

processMailboxWatcher('INBOX', true, 'actionToDo')
processMailboxWatcher('To reply', false, 'replyToDo')
processMailboxWatcher('Waiting', false, 'waitingToDo')
