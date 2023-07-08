" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Color schemes
    Plug 'navarasu/onedark.nvim'
    Plug 'Mofiqul/dracula.nvim'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    " Auto pairs for '(' '[' '{'
    "Plug 'jiangmiao/auto-pairs'
    " :MasonUpdate updates registry contents
    Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
call plug#end()
