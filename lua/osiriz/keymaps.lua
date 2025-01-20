vim.keymap.set(
	{'n', 'v'},
	'<leader>xf',
	vim.diagnostic.open_float,
	{ desc = '[X] Diagnostics [F]loat' }
)
vim.keymap.set(
	'n',
	'<leader>xn',
	vim.diagnostic.goto_next,
	{ desc = '[X] Diagnostics Goto [N]ext' }
)
vim.keymap.set(
	'n',
	'<leader>xp',
	vim.diagnostic.goto_prev,
	{ desc = '[X] Diagnostics Goto [P]revious' }
)
