map [v :VCSVimDiff<cr>
"set cindent
set keywordprg=pydoc
set complete=.,b,u

"set foldmethod=indent
"set foldnestmax=1

set expandtab

"setlocal makeprg=(echo\ '[%]';\ pep8\ %)
"setlocal makeprg=(echo\ '[%]';\ pylint\ %)  
setlocal makeprg=(echo\ '[%]';\ pylint\ --disable=R0904,C0301,W0511,W0142,W0141,R0912,R0913,R0914,R0903,W0212,W0312,C0111,C0103\ %)  
setlocal efm=%+P[%f],%t:\ %#%l:%m

"function! Run()
"python << EOF
"import vim
"
"vim.eval('return "%s"' % vim.current.line)
"EOF
"endfunction

"inoremap [M <c-r>=Run()<cr>
inoremap <S-Tab> <C-d>
map [c :mak<cr>
map [n :cn<cr>
map [N :cN<cr>

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

map [m	:s?^?#?<cr>
noremap [M	:s?^#??<cr>

map! [cl	<c-r>=InsertClassHeader()<cr>
map	 [r		:! python %<cr>
map! [pr	print 
map! [fr    from  import2F a
map! [im	import 

map! [main	if __name__ == '__main__':o

"noremap!  [f	<esc>:let writing=1<cr>i____(self):bbhhhi
"noremap! <esc>	<c-r>=EchoVariable(writing)<cr>
"<esc>:let writing=0<cr>

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

map!		[if		<c-r>=Python('if')<cr>
map!		[con	<c-r>=InsertConstructor()<cr>
"noremap!	<esc>	<c-r>=CheckEscape()<cr>
