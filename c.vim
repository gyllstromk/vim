set foldnestmax=1
set foldlevelstart=0
set makeprg=gcc\ -Wall\ %

map! [in	#include <.h>2hi
map! [main	int main(int argc, char *argv[]) {
map! [pr	printf();hi
map  [c		:mak<cr>
map  [r		:!./a.out<cr>

" Are we using glut?

function! AreWeUsingGlut()
	let currentLine = winline()
	let y = search('#include <GL')

	" Move cursor back
	let q = cursor(currentLine, 0)

	if (y != 0) 
		let m = setwinvar(winnr(), 'makeprg', 'hello')
	endif

	return y
endfunction

map! [poo <c-r>=AreWeUsingGlut()<cr>
