return {
	{
		'folke/snacks.nvim',
		priority = 1000,
		lazy = false,
		opts = {
			explorer = {
				enabled = true,
				replace_netrw = true
			},
			input = { enabled = true },
			scroll = { enabled = true },
			picker = { enabled = true },
		},
		keys = {
			-- Explorer
			{ '<leader>e', function() Snacks.explorer() end, desc = 'File Explorer' },
			-- Find
			{ '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Find Buffers' },
			{ '<leader>ff', function() Snacks.picker.files() end, desc = 'Find Files' },
			{ '<leader>fg', function() Snacks.picker.git_files() end, desc = 'Find Git Files' },
			{ '<leader>fr', function() Snacks.picker.recent() end, desc = 'Find Recent Files' },
			-- LSP
			{ 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' },
			{ 'gD', function() Snacks.picker.lsp_declarations() end, desc = 'Goto Declaration' },
			{ 'gr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'Goto References' },
			{ 'gI', function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementaion' },
			{ '<leader>ss', function() Snacks.picker.lsp_symbols() end, desc = 'LSP Symbols' },
			{ '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols' },
		}
	}
}
