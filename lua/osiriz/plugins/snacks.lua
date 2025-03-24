return {
	{
		'folke/snacks.nvim',
		priority = 1000,
		lazy = false,
		opts = {
			dashboard = {
				enabled = true,
				preset = {
					keys = {
						{ icon = ' ', key = 'f', desc = 'Find File', action = function() Snacks.picker.files() end },
						{ icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
						{ icon = ' ', key = 'r', desc = 'Recent Files', action = function() Snacks.picker.recent() end },
						{ icon = ' ', key = 'e', desc = 'File Explorer', action = function() Snacks.explorer() end },
						{ icon = '󰒲 ', key = 'L', desc = 'Lazy', action = function() require('lazy').home() end, enabled = package.loaded.lazy ~= nil },
						{ icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
					},
					header = table.concat({
						[[   █  █   ]],
						[[   █ ██   ]],
						[[   ████   ]],
						[[   ██ ███   ]],
						[[   █  █   ]],
						[[             ]],
						[[ n e o v i m ]],
					}, '\n'),
				},
				sections = {
					{ section = 'header' },
					{ section = 'keys', gap = 1, padding = { 1, 0 } },
					{ icon = ' ', title = 'Recent Files', padding = { 0, 1 }, enabled = function()
						return vim.o.lines >= 32
					end },
					{ section = 'recent_files', cwd = true, indent = 2, padding = { 1, 0 }, enabled = function()
						return vim.o.lines >= 32
					end },
					{ section = 'startup' },
				},
			},
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
