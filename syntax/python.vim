function! EndOfBlock(forward, vis)
python << EOF

def count_spaces(line):
	spaces = 0
	for i in line:
		if i.isspace():
			spaces += 1
		else:
			break
	return spaces

import vim
vis = vim.eval('a:vis') == '1'
forward = vim.eval('a:forward') == '1'

row = vim.current.window.cursor[0]
line = vim.current.line
spaces = None
if line.strip():
	spaces = count_spaces(line)
nests = False

if forward:
	direction = 1
else:
	direction = -1

row += direction

while 1 <= row <= len(vim.current.buffer):
	cur = vim.current.buffer[row]
	line_spaces = count_spaces(cur)
	if spaces is None:
		spaces = line_spaces

	if line_spaces > spaces:
		nests = True

	row += direction
	if (line_spaces < spaces or (nests and line_spaces == spaces) or line_spaces == spaces == 0) and cur.strip():
		break

row = max(1, row)
row = min(len(vim.current.buffer), row)

if vis:
	vim.command('normal! V')

vim.command('normal %dG' % row)
#vim.current.window.cursor = (row, 0)

EOF
endfunction

map <buffer> { :call EndOfBlock(0, 0)<cr>
map <buffer> } :call EndOfBlock(1, 0)<cr>
vmap <buffer> { :call EndOfBlock(0, 1)<cr>
vmap <buffer> } :call EndOfBlock(1, 1)<cr>

imap <buffer> [db import pdb; pdb.set_trace()

"map [TT	<c-r>=SwapTest()<cr>
"setlocal cindent
setlocal keywordprg=pydoc
setlocal complete=.,b,u

"setlocal foldmethod=indent
"setlocal foldnestmax=1

setlocal expandtab

"setlocal makeprg=(echo\ '[%]';\ pep8\ %)
"setlocal makeprg=(echo\ '[%]';\ pylint\ %)  
setlocal makeprg=(echo\ '[%]';\ pylint\ --disable=W0621,R0904,C0301,W0511,W0142,W0141,R0912,R0913,R0914,R0903,W0212,W0312,C0111,C0103\ %)  
" warning E0602 is important but just conflicts with our parser!
setlocal efm=%+P[%f],%t:\ %#%l:%m

"function! Run()
"python << EOF
"import vim
"
"vim.eval('return "%s"' % vim.current.line)
"EOF
"endfunction

inoremap <buffer> <S-Tab> <C-d>

"im	:<cr>	:<cr><tab>

function! InsertClassHeader()
	execute "normal Iclass " . GetClassName() . "(object):\<cr>\t"
	return ''
endfunction

function! InsertConstructor()
	execute "normal Idef __init__(self):o"
	return ''
endfunction

function! EchoVariable(i)
	if (a:i == 1)
		exec "normal o	"
		let i = 0
	else
		exec "normal "
	endif
	return ''
endfunction

map! <buffer> [cl	<c-r>=InsertClassHeader()<cr>
map <buffer>	 [r		:! python3 %<cr>
"map! <buffer> [pr	print()i
map! <buffer> [pr	print 
map! <buffer> [fr    from  import2F a
map! <buffer> [im	import 

map! <buffer> [main	if __name__ == '__main__':o

"noremap!  [f	<esc>:let writing=1<cr>i____(self):bbhhhi
"noremap! <esc>	<c-r>=EchoVariable(writing)<cr>
"<esc>:let writing=0<cr>

function! SwapTest()
python << EOF
import vim
print vim.current.name
print 'sup'
EOF
endfunction

function! Python(mycommand)
python << EOF
import vim
import string
def getCurrentIndent():
	s = 0
	for char in vim.current.line:
		if char == '\t':
			s = s + 1
		else:
			break
	return s

vim.current.line = str(a:mycommand)
	#indent = getCurrentIndent()
	#cond = string.strip(vim.current.line)
	#ln = vim.current.window.cursor[0]
	#r = vim.current.buffer.range(ln, ln)
	#vim.current.buffer[ln - 1] = indent * '\t' + 'if (' + cond + '):'
	#r.append((indent + 1) * '\t')
	#vim.current.window.cursor = (ln + 1, 1)
EOF
return ''
endfunction

function! CheckEscape()
python << EOF
import vim
import string
if string.find(vim.current.line, 'if (') != -1: # make more elegant test
	
	ln = vim.current.window.cursor[0]
	r = vim.current.buffer.range(ln, ln)
	vim.current.buffer[ln - 1] = ptr * '\t' + 'if ():'
	r.append((ptr + 1) * '\t')
	row = vim.current.window.cursor[0]
	vim.current.window.cursor = (row + 1, vim.current.window.cursor[1])
EOF
endfunction

map! <buffer>		[if		if :i
map! <buffer>		[con	<c-r>=InsertConstructor()<cr>
"noremap!	<esc>	<c-r>=CheckEscape()<cr>
