-- (N)Vim plugins
vim.cmd('source $HOME/.config/nvim/vim-plug/plugins.vim')
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig")["pylsp"].setup{}
require("lspconfig")["clangd"].setup{}
require("lspconfig")["gopls"].setup{}

-- load nvim-cmp
local cmp = require('cmp')
local lspconfig = require('lspconfig')

-- Configure cmp sources
cmp.setup({
  sources = {
    { name = 'nvim_lsp' }, -- Enable nvim-cmp LSP source
    { name = 'buffer' },   -- Enable buffer completion source
    { name = 'path' },     -- Enable path completion source
  },
})

-- Set up LSP key mappings for pylsp
-- Example: Go to definition
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

-- Set up LSP key mappings for clangd
-- Example: Find references
vim.api.nvim_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })

-- Set leader key
vim.g.mapleader = ' '

-- Save and continue on file
vim.api.nvim_set_keymap('n', 'zz', ":update<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<C-J>', ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('v', '<C-K>', ":m '<-2<CR>gv=gv", { noremap = true })

-- Copy to clipboard
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>Y', '"+yg_', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>yy', '"+yy', { noremap = true })
-- Paste from clipboard
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true }) vim.api.nvim_set_keymap('v', '<leader>P', '"+P', { noremap = true })

vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })

-- My configs
vim.cmd('filetype plugin indent on')
vim.cmd('set autoindent')
--vim.cmd('set clipboard=unnamedplus')
vim.cmd('set cursorline')
vim.cmd('set expandtab')
vim.cmd('set inccommand=split')
vim.cmd('set number')
vim.cmd('set noswapfile')
vim.cmd('set rnu')
vim.cmd('set shiftwidth=4')
vim.cmd('set tabstop=4')
vim.cmd('syntax on')

vim.g.onedark_config = {
  style = 'darker',
}
vim.cmd('colorscheme catppuccin-macchiato')
