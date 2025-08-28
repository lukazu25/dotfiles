set mouse=a
set number 
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set noswapfile
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
call plug#end()
set bg=dark
colo nord
inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>
let NERDTreeShowHidden=1
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
" In your init.lua or init.vim
set termguicolors
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_powerline_fonts = 1
set t_Co=256
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Up> :bnext<CR>
nnoremap <C-Down> :bprev<CR>
nnoremap <C-T> :tabnew<CR>
