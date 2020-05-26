if exists("b:did_ftplugin") | finish | endif

if !exists("g:tagbar_type_elm")
  let g:tagbar_type_elm = {
      \ 'ctagstype' : 'ElmCustom',
      \ 'ctagsargs' : [ '--options='.$HOME.'/.config/ctags/', '-o-'],
      \ 'kinds'     : [
          \ 'm:Modules:0:0',
          \ 'i:Imports:0:0',
          \ 't:Types:0:0',
          \ 'a:Aliases:0:0',
          \ 'c:Constants:0:0',
          \ 'p:Ports:0:0',
          \ 'f:Functions:0:0',
          \ 'r:Records:0:0',
          \ 'y:Type constructors:0:0'
          \ ],
      \ 'sro'      : ':',
      \ 'kind2scope' : {},
      \ 'scope2kind' : {}
  \ }
endif

packadd vim-css-color
