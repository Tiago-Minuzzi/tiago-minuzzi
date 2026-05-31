-- Options
vim.o.clipboard = 'unnamedplus'
vim.o.confirm = true
vim.o.cursorline = true
vim.o.errorbells = false
vim.o.incsearch = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes:1'
vim.o.splitbelow = true
vim.o.tabstop = 4

-- Packages
vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')

vim.pack.add {
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/catppuccin/nvim',
	'https://github.com/ellisonleao/gruvbox.nvim',
}

-- Keymaps
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>hor te<CR>")

-- Callings and sets
require("oil").setup()
require("gruvbox").setup()
vim.cmd.colorscheme("gruvbox")
