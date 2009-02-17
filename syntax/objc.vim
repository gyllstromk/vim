source ~/.vim/cst.vim
set foldmethod=syntax
set foldenable
set cindent
set foldnestmax=1

map			[r	:!make run<cr>
map!	@ex	(NSException *exception) {{
map!	[try	@try {{jA @catch kcc
map!	[im<	#import <>i
map!	[im"	#import ""i
map! [pr	NSLog(@"");F"i
map  [c		:call Compile()<cr>
"set makeprg=xcodebuild\ -buildstyle\ Development
