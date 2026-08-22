let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_altfile = 1
let g:netrw_dirhistmax = 0
syntax on
filetype plugin on
set nocompatible
set encoding = utf-8
set number 
set relativenumber
set expandtab
set tabstop = 4
set softtabstop = 4
set shiftwidth = 4
set hlsearch
set incsearch
set ignorecase
set smartcase
set splitbelow
set noswapfile
set undofile
set nobackup
set nowritebackup
set path+=**
set wildmenu
set clipboard = unnamedplus   
set undodir = ~/.vim/undodir
nnoremap ,c :-1read $HOME/.vim/snippets/example.c<CR>
nnoremap ,cpp :-1read $HOME/.vim/snippets/example.cpp<CR>
nnoremap ,go :-1read $HOME/.vim/snippets/example.go<CR>
nnoremap ,rust :-1read $HOME/.vim/snippets/example.rs<CR>
nnoremap ,java :-1read $HOME/.vim/snippets/example.java<CR>
nnoremap ,python :-1read $HOME/.vim/snippets/example.py<CR>
nnoremap ,html :-1read $HOME/.vim/snippets/example.html<CR>
