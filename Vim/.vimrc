let g:netrw_dirhistmax = 0
let g:netrw_banner=0
let g:netrw_liststyle=3
set nocompatible
set encoding=utf-8
set number 
set relativenumber
syntax on
filetype plugin indent on
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set splitbelow
set noswapfile
set noundofile
set nobackup
set nowritebackup
set clipboard=unnamedplus
nnoremap ,c :-1read $HOME/.vim/snippets/example.c<CR>
nnoremap ,cpp :-1read $HOME/.vim/snippets/example.cpp<CR>
nnoremap ,go :-1read $HOME/.vim/snippets/example.go<CR>
nnoremap ,rust :-1read $HOME/.vim/snippets/example.rs<CR>
nnoremap ,java :-1read $HOME/.vim/snippets/example.java<CR>
nnoremap ,python :-1read $HOME/.vim/snippets/example.py<CR>
nnoremap ,html :-1read $HOME/.vim/snippets/example.html<CR>
