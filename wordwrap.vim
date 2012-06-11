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

noremap <buffer> [t :call Dd()<cr>

noremap <buffer> j gj
noremap <buffer> k gk
setlocal wrap
setlocal lbr

nnoremap <buffer> dd :call Dd()<cr>
nnoremap <buffer> D dg$
"nnoremap <buffer> dd g0dg$
"
nnoremap <buffer> yy g0yg$
nnoremap <buffer> Y yg$
nnoremap <buffer> cc g0cg$
nnoremap <buffer> C cg$
nnoremap <buffer> A g$a
nnoremap <buffer> I g0i

"nnoremap o g$a

nnoremap <buffer> V g0vg$
" XXX does not work here:
" AAAAAAAAAAAAAAAAAAAAAAAAA
" AAAAAAAAAAAAAAAAAAAAAAAAA
" AAAAAAA
"
" When we start on last line, hit V, then go up

"nnoremap L :call Last()<cr>

setlocal spell

noremap <buffer> $ g$
noremap <buffer> 0 g0
