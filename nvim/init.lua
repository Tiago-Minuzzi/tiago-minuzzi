-- (N)Vim plugins
vim.cmd('source $HOME/.config/nvim/vim-plug/plugins.vim')
-- Set leader key
vim.g.mapleader = ' '

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
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>P', '"+P', { noremap = true })

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
