vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes:1'
vim.o.confirm = true
vim.opt.clipboard = 'unnamedplus'

vim.pack.add {
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/catppuccin/nvim',
}

require("oil").setup()
vim.cmd.colorscheme("catppuccin")
