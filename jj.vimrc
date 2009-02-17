map		@com	:!javac %
map		@run	:!java $(echo % \| sed s/\.java//)
map!	@pr		System.out.println();ba
map!	@err	System.err.println();ba
map!	@buf BufferedReader = new BufferedReader(onew InputStreamReader());-wi
map!	@deb	if (DEBUGGING) System.err.println("[DEBUG]:");hhi 
map!	@class	class :r! echo %< <CR>kJA {{
map!	@con	public :r! echo %< <CR>kJA() {{
map!	@main	PARSER_BEGIN(r! echo %<i) public static void main(String args[]) {o}O
