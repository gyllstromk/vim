"set nocindent
let tlist_tex_settings='latex;b:bibitem;c:command;l:label'

"function Search(prompt)
"	let searchstring=substitute(input(a:prompt), ' ', '\\_s', 'g')
"		return a:prompt.searchstring."\n"
"endfunction

"nnoremap <buffer> <silent> / Search('/')

set textwidth=79
"inoremap  gwap

set spell

map [v :VCSVimDiff<cr>

map [M	:s?^\_s*%\+??<cr>
map [m	:s?^?%?<cr>

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

inoremap	<c-t>	:s?.*?\\textit{&}<cr>
inoremap	<c-b>	:s?.*?\\textbf{&}<cr>

"inoremap		{gq}

map!	[be	\begin{}o\end{}k$i
map!	[ta \begin{table}[ht]\capstart\begin{center}\begin{tabular}\end{tabular}\end{center}\end{table}
map!	[fi \begin{figure}[ht]o\capstart\begin{centering}\includegraphics[width=\columnwidth]{}\caption{}o\label{}\end{centering}\end{figure}4k0f{a
map!	[su	\subsection{}i
map!	[se	\section{}i
map!	[it	\begin{itemize}o\item o\end{itemize}k$a
"map!	<c-i> {\it }i
