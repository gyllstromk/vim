source ~/.vim/cst.vim
set foldmethod=syntax
set foldenable
set foldnestmax=1
"syn region foldBraces start=/.*{.*/ end=/.*}.*/ transparent fold keepend extend
"set foldnestmax=2

map	[h		:AS<cr>
map	[H		:A<cr>

function! ClassDecCpp()
python << EOF
import vim, os
name = '.'.join(os.path.basename(vim.current.buffer.name).split('.')[:-1])
defname = '_'.join(os.path.basename(vim.current.buffer.name).split('.')).upper()
vim.command('normal i#ifndef EDU_UNC_CS_%s' % defname)
vim.command('normal i#define EDU_UNC_CS_%s' % defname)
vim.command('normal iclass %s {o};#endifkO' % name)
EOF
endfunction!

"function! ConstRef()
"python << EOF
"import vim
"i = raw_input()
"value = 'const %s &' % i
"EOF
"return value
"endfunction!

inoremap [ct	:call ConstRef()<cr>i	

inoremap [cl	:call ClassDecCpp()<cr>i
map! [in	#include <>i
imap [main	int main(int argc, char *argv[]) {{
map! [pr	std::cout << << std::endl;3F<a 
map! [en	std::endl;
map  [c		:call Compile()<cr>
"map  [r		:!./%<<cr>
map  [r		:!make run<cr>
ab	st		std::string
map! [set	std::set<  > 2F a
map! [vec	std::vector<  > 2F a
map! [foe	BOOST_FOREACH () {o}kf(a
