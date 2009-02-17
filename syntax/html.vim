"function InsertClosingTag()
"	let x=getline(".")
"	echo $x
"endfunction

map			<F1>	:!konqueror %& 2> /dev/null
noremap!	<bd		<body>o</body>O
"noremap!	<h1		<h1 align="center"><h1>bhi
noremap!	<h4		<h4></h4>F>a
"noremap!	>		<c-r>=InsertClosingTag()<cr>
