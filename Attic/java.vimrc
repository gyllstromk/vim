"set complete=i,.,k~/.vim/complete/java,b,u
"set makeprg=jikes\ -nowarn\ -Xstdout\ +E\ -d\ /home/karl/cs.unc.edu/tmp/classes\ %
"set makeprg=javac\ %
"set makeprg=jikes\ -nowarn\ -Xstdout\ +E\ -d\ /home/karl/tmp/classes\ %
"set makeprg=jikes\ -nowarn\ -Xstdout\ +E\ -d\ .\ %
set makeprg=ant
set errorformat=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

"syn sync fromstart
set foldmethod=syntax
syn region myFold start="{" end="}" transparent fold
"set fillchars=stl:_,stlnc:-,vert:\|,fold:\ ,diff:-
set foldnestmax=2
set foldlevel=1
"set foldlevelstart=0

" Needs work
"set cinoptions=jN

map!		<C-enter>	lDop
map!		<C-J>	ji
map!		<C-K>	ki
map!		<C-l>	lli
map!		<C-H>	i
map		[co		:!javac %<cr>
map!		[co		:!javac %<cr>
map		[c		:!javac %<cr>
"map		[r		:!/home/karl/src/java/jrun/java <c-r>=GetPackageName()<cr>%<<cr>
map		[r		:!java %<<cr>

map		[im		iimport java.;i
map!	[im		import java.;i

map!	[pf		edu.unc.cs.karl.util.Printer.printfln();F)i[rm
map!	[pr		edu.unc.cs.karl.util.Printer.println();F)i
map!	[ln		System.out.println();ba

map!	[er		System.err.println();ba

map!	[buf BufferedReader = new BufferedReader(onew InputStreamReader());-wi
map!    [pw 	PrintWriter out = new PrintWriter(, true);Bba
map!	[deb	Debug.println();hi

map!	[main	public static void main(String args[]) {{
map!	[gcp	getContentPane().

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
	"execute "normal iclass " . GetClassName() . " {\<esc>o}\<esc>O"
	execute "normal iclass " . GetClassName() . "{o}kf{"
	return ''
endfunction!

inoremap	[poo <c-r>=GetPackageName()<cr>
inoremap	[cn <c-r>=Constructor()<cr>
inoremap	[cl	<c-r>=ClassDec()<cr>	
