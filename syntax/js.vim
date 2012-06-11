source ~/.vim/comment.vim

noremap <buffer> [n	:call AddComment(0, '//')<cr>
noremap <buffer> [N	:call AddComment(1, '//')<cr>
imap <buffer> [pr console.log();F(a
