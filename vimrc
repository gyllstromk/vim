let mapleader = "["
syntax enable
set viminfo='1000,f1,:100,@100,/100,h,%
set tabstop=4
set shiftwidth=4
set autowrite
set ruler
set bs=2

set undofile " persistent undo

set relativenumber
set colorcolumn=80

set cursorline
set cursorcolumn

set pastetoggle=<F2>

"set rnu

if has("gui_running")
	set guioptions=egmrt  " disable toolbar in macvim
endif

call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/vim-easy-align'
Plug 'nvie/vim-flake8'
Plug 'phleet/vim-mercenary'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
call plug#end()

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

if &diff
    noremap <C-c> :qa<cr>
endif

set completeopt=menu,longest  " find longest common string

" So when i complete file names it stops at longest
set wildmode=longest:full
set wildmenu

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

function! VCSStatus()
  if exists(":Gstatus")
    Gstatus
  elseif exists(":HGStatus")
    HGStatus
  endif
endfunction

function! VCSDiff()
  if exists(":Gdiff")
    Gdiff
  elseif exists(":HGdiff")
    HGdiff
  endif
endfunction

map <leader>g :call VCSStatus()<cr>
map <leader>v :call VCSDiff()<cr>

" Buffer exploring
map		<leader>a		<leader>be
map		<leader>j		<leader>bs
map		<leader>J		<leader>bv

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

syntax enable

set background=light
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:solarized_contrast="high"
colorscheme solarized

inoremap <buffer> <S-Tab> <C-d>

au BufRead,BufNewFile *.txt setfiletype text

let @o = "dd/===V/>>>x/<<<"
let @t = "V/===x/>>>dd/<<<"

xmap <Enter> <Plug>(EasyAlign)
nmap <Enter> <Plug>(EasyAlign)

source ~/.vim/local.vimrc
