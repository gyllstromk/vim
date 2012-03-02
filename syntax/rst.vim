function! Openrst()
  echo system('rst2html.py '.expand('%:t').' | open -f')
endfunction!

"' | open -f -a Safari')

map [r :call Openrst()<cr>
