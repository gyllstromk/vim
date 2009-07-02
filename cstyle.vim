set cindent
set foldmethod=syntax
syn region myFold start="{" end="}" transparent fold

map [v :VCSVimDiff<cr>

" a.vim
"set foldmethod=syntax
"syn region myFold start="{" end="}" transparent fold
"set fillchars=stl:_,stlnc:-,vert:\|,fold:\ ,diff:-
"set foldnestmax=1
"set foldlevel=0

map	[h		:AS<cr>
map	[H		:A<cr>

inoremap	[try	try {o} catch O

inoremap	[ex		(Exception e) {o}O


inoremap		{{ {o}O
"inoremap		[{	{  }hi

"noreab		if		<c-r>=CreateConditionalStatement("f")<cr>

"noremap!			<c-r>=Escappe()<cr>				
inoremap		o
inoremap	<Shift>	<cr>
"<c-r>=Enterr()<cr>

function! Enterr()
	if g:entering == 1
		let g:entering = 0
		return 'o'
	else
		return ''
	endif
endfunction
	
function! Escappe()
	if g:escaping == 1
		let g:escaping = 0
		return ''
	else
		return ''
	endif
endfunction

"map!	[pu		public 
"map!	[pb		public 
"ab		pb		public
ab		pu		public
"ab		pc		public

"map!	[pv		private 
"ab		pv		private

"map!	[pt		protected 
"ab		pt		protected

"map!	[brack	{j>}}o}

"ab		vo		void
"ab		vd		void
"ab		fl		float
"ab		db		double
"ab		sh		short
"ab		st		String

function! GetTab()
	let indent = cindent(winline())
	let tab = ""
	while (indent >= 0)
		let tab=tab . "	"
		" tab stop important here
		let indent=indent-4
	endwhile
	return tab
endfunction

function! CreateFunction()
	let name=input("Name: ")
	let return=input("Return type: ")
	let access=input("Access: ")
	let parameters=input("Parameters: ")

	execute "normal i" . access . " " . return . " " . name . "(" .  parameters . ") {o}O"
	return GetTab()
endfunction

function! CreateConditionalStatement(type)
	let indent = cindent(winline())

	let y = input(a:type . ": ")

	let tab = ""

	execute "normal i" . a:type . " (" . y . ") {o}O"
	while (indent >= 0)
		let tab=tab . "	"
		" tab stop important here
		let indent=indent-4
	endwhile
	return tab
endfunction

function! TryIf()
	let g:escaping = 1
	let g:entering = 1
endfunction

inoremap	[if	if () {o}kf(a
"<cr>if () {o}kf(a
inoremap	[fo		for () {o}kf(a
inoremap	[wh		while () {o}kf(a
"inoremap	[if	<ESC>:call TryIf()<cr>ccif () {o}kf(a
"<cr>if () {o}kf(a
"inoremap	[fo		<ESC>:call TryIf()<cr>ccfor () {o}kf(a
"inoremap	[wh		<ESC>:call TryIf()<cr>ccwhile () {o}kf(a
