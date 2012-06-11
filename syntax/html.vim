function! SetEnter()
python << endpython
import vim
vim.command('let b:enterbreaks=0')
endpython
endfunction

function! Enter()
python << endpython

import vim
evalbreaks = vim.eval('b:enterbreaks')
vim.command('let b:enterbreaks=1')

if evalbreaks:
	vim.command('let l:return=1')
else:
	vim.command('let l:return=0')
endpython
if l:return == 1
	return ''
else
	return 'o'
endif
endfunction

function! Braces()
python << endpython

import vim
vim.command('normal i{% %}')

endpython
endfunction

let b:enterbreaks=1

imap <buffer>			[sc		<script type="text/javascript"></script>O

map <buffer> [v @ :VCSVimDiff<cr>
map <buffer>			[r		:! open %<cr>
"noremap!	<h1		<h1 align="center"><h1>bhi
noremap! <buffer>	<h4		@ <h4></h4>F>a
"noremap!	>		<c-r>=InsertClosingTag()<cr>
imap <buffer>	[fu	function () {}kf(i
"inoremap {%	:=Braces()<cr>
"inoremap 	<c-r>=Enter()<cr>
