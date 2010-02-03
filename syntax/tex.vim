"set nocindent
let tlist_tex_settings='latex;b:bibitem;c:command;l:label'

set textwidth=79
"inoremap  gwap

set spell

map [v :VCSVimDiff<cr>

map [M	:s?^\_s*%\+??<cr>
map [m	:s?^?%?<cr>

function! Open()
python << EOF
import vim, os
if os.path.exists('Makefile'):
	vim.command(':!make read')
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

map!	<c-t>	{\it }i
map!	<c-b>	{\bf }i

map!	[be	\begin{}o\end{}k$i
map!	[ta \begin{table}[ht]\begin{center}\begin{tabular}\end{tabular}\end{center}\end{table}
map!	[fi \begin{figure}[h]o\capstart\begin{centering}\includegraphics[width=\columnwidth]{}\caption{}o\label{}\end{centering}\end{figure}4k0f{a
map!	[su	\subsection*{}i
map!	[se	\section*{}i
map!	[it	\begin{itemize}o\item o\end{itemize}k$a
"map!	<c-i> {\it }i
