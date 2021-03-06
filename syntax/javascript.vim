function! Parenths()
python << EOF

import vim
pos = vim.current.window.cursor;

line = vim.current.line

if line.find(';') == -1 and line.find('{') == -1:
    if line.find('catch') >= 0:
        line += ' {'
    elif line.find(':') >= 0 and line[-1] != ',':
        line += ','
    elif line[-1] in ',>':
        pass
    else:
        line += ';'

line = line[:pos[1] + 1] + '()' + line[pos[1] + 1:]
vim.current.buffer[pos[0] - 1] = line
EOF
endfunction

function! Log()
python << EOF

PRINT = 'console.log('

import vim

line = vim.current.line
pos = vim.current.window.cursor
space = 0
while line[space].isspace() and space < len(line):
    space += 1

line = space * ' ' + line[:pos[1]] + PRINT + line[pos[1]:len(line) - 1] + ');'
vim.current.buffer[pos[0] - 1] = line

EOF
endfunction

function! Run()
python << EOF

import vim

# we define a test as one in which one of the first 10 lines starts with
# 'describe'
for line in vim.current.buffer:
    if line.startswith('describe'):
        vim.command(':! ./node_modules/.bin/mocha --bail %')
        break
else:
    vim.command(':! node %')

EOF
endfunction


source ~/.vim/cstyle.vim

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

setlocal expandtab

let g:commentchar = '//'
inoremap <buffer> [db logger.debug();F(a
inoremap <buffer> [in logger.info();F(a
inoremap <buffer> [er logger.error();F(a
inoremap <buffer> [wa logger.warn();F(a
"inoremap <buffer> [pr console.log();F(a
"inoremap <buffer> [pr :call Log()<cr>f(a

inoremap <buffer> [fu function () {}k$F(a
inoremap <buffer> [im require('')F'i

setlocal makeprg=(./node_modules/.bin/jshint\ %)
setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
map <buffer> [r :call Run()<cr>

inoremap <buffer> /**   /**/O

"inoremap <buffer> (    ()i

inoremap <buffer> ==    ===
inoremap <buffer> !=    !==

"inoremap <buffer> ( :call Parenths()<cr>f(a
inoremap <buffer> <D-tab>   f)a

inoremap <buffer>     }oo
inoremap <buffer> [(    (
