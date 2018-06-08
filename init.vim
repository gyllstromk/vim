let mapleader = "["
syntax enable
set viminfo='1000,f1,:100,@100,/100,h,%
set tabstop=2
set shiftwidth=2
set autowrite
set ruler
set bs=2

set nohlsearch
set incsearch
set autoindent

let g:python3_host_prog='/usr/bin/python3'

set undofile " persistent undo

set number relativenumber
set colorcolumn=80

set cursorline
set cursorcolumn

set pastetoggle=<F2>

"set rnu

if has("gui_running")
  set guioptions=egmrt  " disable toolbar in macvim
endif

let g:ctrlp_max_files=0

set nofoldenable

filetype off                  " required

filetype plugin indent on    " required

call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'bronson/vim-trailing-whitespace'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'easymotion/vim-easymotion'
Plug 'hhvm/vim-hack'
Plug 'phleet/vim-mercenary'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/vim-easy-align'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'mileszs/ack.vim'
Plug 'nvie/vim-flake8'
Plug 'Shougo/vimproc.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/a.vim',
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
" (Optional) Multi-entry selection UI.
Plug 'Shougo/denite.nvim'

" (Optional) Completion integration with deoplete.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" (Optional) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'
call plug#end()

let g:deoplete#enable_at_startup = 1

map <leader>t :FZF<cr>


let g:LanguageClient_serverCommands = {
    \ 'php': ['hh', 'lsp'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <c-]> :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <c-\> :call LanguageClient_textDocument_references()<CR>
"nnoremap <silent> <C-f> :call LanguageClient_textDocument_formatting()<CR>
"nnoremap!  :LanguageClientStop<cr>:LanguageClientStart<CR>

" Use vundle to install fzf. Probably need to install binary manually"
" C-p search/open for files in sub-directory "
nnoremap <C-P> :call fzf#run({'source': '~/bin/fb-files sub', 'sink': 'e'})<CR>
" C-l search/open for files in the full repository index:"
nnoremap <C-L> :call fzf#run({'source': '~/bin/fb-files', 'sink': 'e'})<CR>


let g:CommandTFileScanner='watchman'

set expandtab

" Tab completion

" If diff mode, ctrl-c kills all for fast scanning
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
  elseif exists(":Hgstatus")
    Hgstatus
  endif
endfunction

function! VCSDiff()
  if exists(":Gdiff")
    Gdiff
  elseif exists(":Hgvdiff")
    Hgvdiff
  endif
endfunction

function! VCSBlame()
  if exists(":Gblame")
    Gblame
  elseif exists(":Hgannotate")
    Hgannotate
  endif
endfunction

map <leader>g :call VCSStatus()<cr>
map <leader>v :call VCSDiff()<cr>
map <leader>l :call VCSBlame()<cr>

" Buffer exploring
map <leader>a <leader>be
map <leader>j <leader>bs
map <leader>J <leader>bv

"Emulate how "Y" _should_ work
noremap Y y$

imap <c-k> <ESC>ki
imap <c-j> <ESC>ji
imap <c-o> <ESC>o
imap <c-l> <ESC>2li
imap <c-h> <ESC>hi
"Facilitate window changes
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-k> <c-w>k
map <c-j> <c-w>j
map <c-n> :cn<cr>

syntax enable

set background=light
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:solarized_contrast="high"
colorscheme solarized

inoremap <buffer> <S-Tab> <C-d>

au BufRead,BufNewFile *.txt setfiletype text

let @o = "dd/^=====V/>>>>>>>x/<<<<<<<"
let @t = "V/^=====x/>>>>>>>dd/<<<<<<<"

" xmap <Enter> <Plug>(EasyAlign)
" nmap <Enter> <Plug>(EasyAlign)

if filereadable(glob("~/.vim/local.vimrc")) 
    source ~/.vim/local.vimrc
endif

" omnifunc selection overrides
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let g:CommandTFileScanner='watchman'

inoremap <leader>fn <C-R>=expand("%:t:r")<CR>

function! PhabLink()
  let link="'https://phabricator.fb.com/diffusion/E/browse/tfb/trunk/www/".@%."$".line('.')."'"
  echo link
endfunction

nmap <leader>po :call PhabLink()<cr>
