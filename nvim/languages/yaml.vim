let g:LanguageClient_serverCommands.yaml = ['node', substitute(system('npm root -g'),'\n','','g').'/yaml-language-server/out/server/src/server.js', '--stdio']

" vim: tabstop=2 softtabstop=2 shiftwidth=2
