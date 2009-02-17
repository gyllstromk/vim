"set nocindent

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
map		[r	:!open %<.pdf<cr>
map!	[d	\documentclass{}i
map		[c	:call Compile()<cr>

map!	<c-t>	{\it }i
map!	<c-b>	{\bf }i

map!	[be	\begin{}o\end{}k$i
map!	[fi \begin{figure}o\begin{centering}
\caption{}o\label{}
\end{centering}
\end{figure}k$i
map!	[su	\subsection*{}i
map!	[se	\section*{}i
map!	[it	\begin{itemize}o\item o\end{itemize}k$a
"map!	<c-i> {\it }i
