function! Last()
"	vim.current.cursor
endfunction!

function! Dd()
python << EOF
import vim
current = vim.current.window.cursor

# is this line wrapped?
vim.command('normal! g$')
col1 = vim.current.window.cursor[1]
vim.command('normal! $')
col2 = vim.current.window.cursor[1]
vim.command('normal! g0')
col3 = vim.current.window.cursor[1]
vim.command('normal! 0')
col4 = vim.current.window.cursor[1]

vim.current.window.cursor = current

notwrapped = (col1 == col2) and (col3 == col4)

vim.command('normal! g0dg$')
if notwrapped:
	vim.command('normal! J')
EOF
endfunction!

noremap [t :call Dd()<cr>

noremap j gj
noremap k gk
set wrap
set lbr

nnoremap dd :call Dd()<cr>
nnoremap D dg$
"nnoremap dd g0dg$
"
nnoremap yy g0yg$
nnoremap Y yg$
nnoremap cc g0cg$
nnoremap C cg$
nnoremap A g$a
nnoremap I g0i

"nnoremap o g$a

nnoremap V g0vg$
" XXX does not work here:
" AAAAAAAAAAAAAAAAAAAAAAAAA
" AAAAAAAAAAAAAAAAAAAAAAAAA
" AAAAAAA
"
" When we start on last line, hit V, then go up

"nnoremap L :call Last()<cr>

set spell

noremap $ g$
noremap 0 g0
