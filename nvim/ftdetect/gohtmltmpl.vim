" For now, let's just assume that if the cwd contains a config.* file, the html
" files are gohtmpltmpl. This is likely to create a lot of false positives for
" many, but works fine for me at the moment.
autocmd BufRead,BufNewFile *.html
  \  if len(glob(getcwd() . '/config.*')) > 0
  \|   set filetype=gohtmltmpl
  \| endif
