function! Compile()
python << EOF
import vim, os
curdir = '.'
made = False
if 'Makefile' in os.listdir(curdir):
	vim.command('set makeprg=make')
	made = True
if 'SConscript' in os.listdir(curdir):
	while not 'SConstruct' in os.listdir(curdir):
		curdir = curdir + '/..'
		if not 'SConscript' in os.listdir(curdir):
			break

if 'SConstruct' in os.listdir(curdir):
	vim.command('set makeprg=cd\\ %s\\ &&\\ scons' % curdir)
	#vim.command('set makeprg=cd\\ %s\\ &&\\ scons\\ -j2' % curdir)
elif not made:
	vim.command('set makeprg=g++\ %<')

vim.command(':mak')
EOF
endfunction!

inoremap		{{ {o}O
inoremap	[if	if () {o}kf(a
inoremap		o
inoremap	<Shift>	<cr>
set cindent
map [v :VCSVimDiff<cr>

inoremap	[for	for () {o}kf(a
