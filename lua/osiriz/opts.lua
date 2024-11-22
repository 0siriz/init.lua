vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.fillchars = { eob = ' ' }

vim.wo.number = true

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.diagnostic.config({
	signs = false,
	underline = true,
	virtual_text = {
		spacing = 1,
	},
})

vim.cmd.colorscheme('rose-pine')
