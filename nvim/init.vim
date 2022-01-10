" (N)Vim plugins
source $HOME/.config/nvim/vim-plug/plugins.vim
" My configs
filetype plugin indent on
set autoindent
set clipboard=unnamedplus
set cursorline
set expandtab
set inccommand=split
set number
set rnu
set shiftwidth=4
set tabstop=4
syntax on

hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=16
colorscheme dracula
