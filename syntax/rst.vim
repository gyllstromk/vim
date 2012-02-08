function Openrst()
  echo system('rst2html.py '.expand('%:t').' | open -f -a Safari')
endfunction

"' | open -f -a Safari')

map [r :call Openrst()<cr>
