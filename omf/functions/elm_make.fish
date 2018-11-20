function elm_make
  set -q argv[1]
  and set inputFile $argv[1]
  or set inputFile src/Main.elm

  set -q argv[2]
  and set outputFile $argv[2]
  or set outputFile main.js

  set tempFile tempfile-(random 100000 999999).js

  elm make $inputFile --optimize --output=$tempFile
  and uglifyjs $tempFile --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' | uglifyjs --mangle --output=$outputFile
  rm -f $tempFile
end
