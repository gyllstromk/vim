source ~/.vim/comment.vim
source ~/.vim/cstyle.vim

setlocal expandtab

noremap <buffer> [n	:call AddComment(0, '//')<cr>
noremap <buffer> [N	:call AddComment(1, '//')<cr>
inoremap <buffer> [pr console.log();F(a

inoremap <buffer> [fu function() {}kf{hhi
imap <buffer> [im require('')F'i

map <buffer> [r :!node %<cr>
inoremap <buffer> /**	/**/O

"inoremap <buffer> (	()i
inoremap <buffer> {{ {}O
