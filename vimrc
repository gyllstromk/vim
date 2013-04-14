syntax enable
set viminfo='1000,f1,:100,@100,/100,h,%
set tabstop=4
set shiftwidth=4
set autowrite
set ruler
set bs=2

set undofile " persistent undo

set pastetoggle=<F2>

call pathogen#infect()

"set rnu

if has("gui_running")
	set guioptions=egmrt  " disable toolbar in macvim
endif

set expandtab

" Tab completion

function! InsertTabWrapper() 
      let col = col('.') - 1 
      if !col || getline('.')[col - 1] !~ '\k' 
          return "\<tab>" 
      else 
          return "\<c-n>" 
      endif 
endfunction 

"inoremap <tab>	<c-r>=InsertTabWrapper()<cr>
"noremap! [<tab>	<tab>
"noremap! <C-Tab>	<tab>
inoremap <S-Tab> <C-d>

set completeopt=menu,longest  " find longest common string

" So when i complete file names it stops at longest
set wildmode=longest:full
set wildmenu

let g:VCSCommandDeleteOnHide=1

set shell=zsh

set ignorecase
set smartcase "uses case sensitive if you do all caps

set joinspaces

set nohls

set fo=cqt
"set wm=2

set visualbell

filetype on
filetype indent on
filetype plugin on

autocmd FileType python compiler pylint

let Tlist_Ctags_Cmd='ctags'
autocmd FileType objc set ft=cocoa

highlight SpellBad term=reverse cterm=bold ctermbg=green ctermfg=white 

highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white 
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black 
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black 
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 

autocmd!

" Buffer exploring
map		[a		\be
map		[j		\bs
map		[J		\bv

"Emulate how "Y" _should_ work
noremap Y y$

imap <c-k>	<ESC>ki
imap <c-j>	<ESC>ji
imap <c-o>	<ESC>o
imap <c-l>	<ESC>2li
imap <c-h>	<ESC>hi
"Facilitate window changes
map	<c-l>	<c-w>l
map	<c-h>	<c-w>h
map	<c-k>	<c-w>k
map	<c-j>	<c-w>j
map <c-n>	:cn<cr>
map <c-N>	:cN<cr>

"highlight	Type		ctermfg=blue	guifg=Blue
"highlight	Constant	ctermfg=blue	guifg=Blue
"highlight	Statement	ctermfg=blue	guifg=Blue
"highlight	Identifier	ctermfg=blue	guifg=Blue	
"highlight	Comment		ctermfg=lightgray 	guifg=#838183
"highlight	Type		ctermfg=blue	guifg=Blue

syntax enable

set background=light
let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_visibility="high"
"let g:solarized_contrast="high"
colorscheme solarized

inoremap <buffer> <S-Tab> <C-d>
