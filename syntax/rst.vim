function! Titleize(bigtitle)
python << EOF
import vim

bigtitle = vim.eval('a:bigtitle') == '1'

row, col = vim.current.window.cursor
line = vim.current.buffer[row - 1]
symbol = '=' if bigtitle else '-'
vim.current.buffer[row - 1:row] = [line, symbol * len(line)]
EOF
endfunction!

function! Openrst()
  echo system('rst2html.py '.expand('%:t').' | open -f')
endfunction!

"' | open -f -a Safari')

source $HOME/.vim/wordwrap.vim

map [r :call Openrst()<cr>

noremap <c-s> :call Titleize(0)<cr>
noremap <c-t> :call Titleize(1)<cr>
