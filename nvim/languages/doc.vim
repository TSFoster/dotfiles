augroup doc
  autocmd!
  autocmd BufReadPost *.doc,*.docx,*.odp,*.odt silent %!pandoc "%" --to=markdown -o /dev/stdout
  autocmd BufReadPost *.rtf silent %!textutil "%" -convert html -stdout | pandoc --from=html --to=markdown
augroup END
