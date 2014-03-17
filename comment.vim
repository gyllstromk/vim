function! AddComment(remove)
python << endpython
import vim

commentchar = vim.eval('g:commentchar')

if vim.eval('a:remove') != '0':
    if vim.current.line.startswith(commentchar):
        if vim.current.line[len(commentchar)].isspace():
            pos = len(commentchar) + 1
        else:
            pos = len(commentchar)
        vim.current.line = vim.current.line[pos:]
else:
    vim.current.line = commentchar + ' ' + vim.current.line
endpython
endfunction

noremap <buffer> [n :call AddComment(0)<cr>
noremap <buffer> [N :call AddComment(1)<cr>
