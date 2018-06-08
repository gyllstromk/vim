source ~/.vim/cstyle.vim

"set foldmethod=syntax
"set foldenable
"set foldnestmax=1
"syn region foldBraces start=/.*{.*/ end=/.*}.*/ transparent fold keepend extend
"set foldnestmax=2


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

inoremap <leader>ct	:call ConstRef()<cr>i	

inoremap <leader>cl	:call ClassDecCpp()<cr>i
map! <leader>in	#include <>i
imap <leader>main	int main(int argc, char *argv[]) {{
map! <leader>pr	LOG(INFO) << ;i
map! <leader>er	LOG(ERROR) << ;i
map! <leader>en	std::endl;
map  <leader>c		:call Compile()<cr>
"map  <leader>r		:!./%<<cr>
map  <leader>r		:!make run<cr>
ab	st		std::string
map! <leader>set	std::set<  > 2F a
map! <leader>vec	std::vector<  > 2F a
map! <leader>foe	BOOST_FOREACH () {o}kf(a
