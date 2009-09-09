source ~/.vim/cst.vim
"syntax enable
syn region myFold start="{" end="}" transparent fold
syn sync fromstart
set foldmethod=syntax
set foldnestmax=2
set foldlevel=1
set makeprg=javac\ %
"set errorformat=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

"syn sync fromstart
"syntax enable
"set fillchars=stl:_,stlnc:-,vert:\|,fold:\ ,diff:-

" Needs work
"set cinoptions=jN

map [m	:s?^?//?<cr>

imap	[rm		String.format(")F"a
map		[c		:mak<cr>
"map		[r		:!/home/karl/src/java/jrun/java <c-r>=GetPackageName()<cr>%<<cr>
map		[r		:!java %<<cr>

map		[im		iimport java.;i
map!	[im		import java.;i

map!	[pf		System.out.println();F)i[rm
map!	[pr		System.out.println();F)i
map!	[ln		System.out.println();ba

map!	[er		System.err.println();ba

map!	[buf BufferedReader = new BufferedReader(onew InputStreamReader());-wi
map!    [pw 	PrintWriter out = new PrintWriter(, true);Bba
map!	[deb	Debug.println();hi

map!	[main	public static void main(String args[]) {{

"map!	[fi		final static 

"ab		fi		final static
"ab		sn		synchronized
"ab		imp		implements
"ab		oj		Object
"ab		st		String
"ab		sm		System
"ab		nl		null

"function!s

function! GetPackageName()
	let y = getline(1)
	let y = matchstr(y, 'package.*;')
	if (y != "")
		let y = matchstr(y, '[^ ]*;')
		let y = matchstr(y, '[^;]*')
		let y = y . '.'
	endif
	return y
endfunction!

function! GetBlockType(line)
	let y=a:line
	let y = matchstr(y, "[^\ ]* [^\ ]* {")
	let y = matchstr(y, "^[^\ ]*")
	return y
endfunction!

function! Constructor()
	execute "normal ipublic " . GetClassName() . "() {o}kf)"
	return ''
endfunction!

function! ClassDec()
	execute "normal iclass " . GetClassName() . " {o}kf{h"
	"execute "normal iclass " . GetClassName() . " {o}kf{hi"
	return ''
endfunction!

inoremap	[poo <c-r>=GetPackageName()<cr>
inoremap	[con <c-r>=Constructor()<cr>
inoremap	[cl	<c-r>=ClassDec()<cr>
