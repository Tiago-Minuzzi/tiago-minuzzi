" (N)Vim plugins
source $HOME/.config/nvim/vim-plug/plugins.vim
" Set leader key
let mapleader = "\<Space>"

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

noremap <silent> k gk
noremap <silent> j gj
" My configs
filetype plugin indent on
set autoindent
"set clipboard=unnamedplus
set cursorline
set expandtab
set inccommand=split
set number
set noswapfile
set rnu
set shiftwidth=4
set tabstop=4
syntax on

let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme onedark
