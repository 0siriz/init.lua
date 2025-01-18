vim.keymap.set(
	{'n', 'v'},
	'<leader>df',
	vim.diagnostic.open_float,
	{ desc = '[D]iagnostics [F]loat' }
)
vim.keymap.set(
	'n',
	'<leader>dn',
	vim.diagnostic.goto_next,
	{ desc = '[D]iagnostics Goto [N]ext' }
)
vim.keymap.set(
	'n',
	'<leader>dp',
	vim.diagnostic.goto_prev,
	{ desc = '[D]iagnostics Goto [P]revious' }
)
