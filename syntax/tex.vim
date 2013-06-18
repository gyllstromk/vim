"set nocindent

let g:tex_flavor='latex'

let tlist_tex_settings='latex;b:bibitem;c:command;l:label'

"function Search(prompt)
"	let searchstring=substitute(input(a:prompt), ' ', '\\_s', 'g')
"		return a:prompt.searchstring."\n"
"endfunction

"nnoremap <buffer> <silent> / Search('/')

"set textwidth=79
"inoremap  gwap

set spell

source ~/.vim/wordwrap.vim

set nojoinspaces  " no double space after periods

set conceallevel=2

syn region inBold concealends matchgroup=bTag start="\textbf" end="}"
syn region inEmph concealends matchgroup=eTag start="textit" end="}"

hi inBold gui=bold
hi bTag guifg=blue
hi inEmph gui=italic

map [N	:s?^\_s*%\+??<cr>
map [n	:s?^?%?<cr>

function! Open()
python << EOF
import vim, os
opened = os.path.exists('Makefile')
if opened:
	opened = vim.command(':!make read')
else:
	vim.command(':!open %<.pdf')
EOF
endfunction!

function! Compile()
python << EOF
import vim, os
if os.path.exists('Makefile'):
	vim.command(':!make')
else:
	vim.command(':!pdflatex %;')
EOF
endfunction!

map!	[im	\usepackage{}i
map		[r	:call Open()<cr>
map!	[d	\documentclass{}i
map		[c	:call Compile()<cr>

noremap	<c-t>	eb"Aywcw\textit{}P
inoremap	<c-t>	eb"Aywcw\textit{}P
inoremap	<c-b>	eb"Aywcw\textbf{}P
inoremap	<c-l>	eb"Aywcw\texttt{}P

"inoremap		{gq}

map!	[be	\begin{}o\end{}k$i
map!	[ta \begin{table}[ht]\capstart\begin{center}\tinput{}\end{center}\caption{}\tlabel{}\end{table}
map!	[fi \begin{figure}[ht]o\capstart\begin{centering}\includegraphics[width=\columnwidth]{}\caption{}o\flabel{}\end{centering}\end{figure}4k0f{a
map!	[su	\subsection{}i
map!	[se	\section{}i
map!	[it	\begin{itemize}o\item o\end{itemize}k$a
"map!	<c-i> {\it }i
