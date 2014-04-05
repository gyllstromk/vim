source ~/.vim/cstyle.vim
let g:commentchar = '//'
source ~/.vim/comment.vim

let g:SuperTabDefaultCompletionType = 'context'

syn region myFold start="{" end="}" transparent fold
syn sync fromstart
set foldmethod=syntax
set foldnestmax=2
set foldlevel=2

set colorcolumn=120

"syn sync fromstart
"syntax enable
"set fillchars=stl:_,stlnc:-,vert:\|,fold:\ ,diff:-

" Needs work
"set cinoptions=jN

imap <buffer>	[rm		String.format(")F"a
"map <buffer>		[r		:!/home/karl/src/java/jrun/java <c-r>=GetPackageName()<cr>%<<cr>
map <buffer> <leader>r :JUnit %<cr>

noremap <buffer>	<C-i> :JavaImport<cr>
noremap <buffer>	<leader>im		:JavaImport<cr>
imap <buffer>	[ij		import java.;i

map! <buffer>	[pf		System.out.println();F)i[rm
map! <buffer>	[pr		System.out.println();F)i
map! <buffer>	[ln		System.out.println();ba

map! <buffer>	[buf BufferedReader = new BufferedReader(onew InputStreamReader());-wi
map! <buffer>    [pw 	PrintWriter out = new PrintWriter(, true);Bba
map! <buffer>	[deb	Debug.println();hi

map! <buffer>	[main	public static void main(String[] args) {

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

function! GetClassName()
    return expand("%:t:r")
endfunction!

function! Constructor()
	execute "normal i/**/public " . GetClassName() . "() {o}kf)"
	return ''
endfunction!

function! ClassDec()
	execute "normal i/**@author stromk/public class " . GetClassName() . " {o}kf{h"
	return ''
endfunction!

inoremap <buffer>	[poo <c-r>=GetPackageName()<cr>
inoremap <buffer>	[con <c-r>=Constructor()<cr>
inoremap <buffer>	[cl	<c-r>=ClassDec()<cr>
inoremap <buffer>   [in log.info("");F"i
inoremap <buffer>   [wa log.warn("");F"i
inoremap <buffer>   [er log.error("");F"i

noremap <buffer> [c :set errorformat=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#,[checkstyle]\ %f:%l:%c:\ %m,[checkstyle]\ %f:%l:\ %m<cr>:set makeprg=brazil-build\ checkstyle<cr>:make<cr>

inoremap <buffer>   [dc /**@author stromk/kkkA 
inoremap <buffer>   [do /**/O

"augroup Java
"    au BufNewFile *.java 0r ~/.vim/skeletons/skel.java
"augroup end
