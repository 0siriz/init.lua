vim.keymap.set(
	{'n', 'v'},
	'<leader>df',
	vim.diagnostic.open_float,
	{ desc = '[D]iagnostics [F]loat' }
)
