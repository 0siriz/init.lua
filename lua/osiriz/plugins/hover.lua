return {
	{
		'lewis6991/hover.nvim',
		event = { 'VeryLazy' },
		config = function()
			require('hover').setup({
				init = function()
					require('hover.providers.lsp')
					require('hover.providers.diagnostic')
				end,
				preview_opts = {
					border = 'single',
				},
				preview_window = false,
				title = true,
			})

			vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover' })
			vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover (select)' })
			vim.keymap.set('n', '<C-p>', function() require('hover').hover_switch('previous') end, { desc = 'hover (previous)' })
			vim.keymap.set('n', '<C-n>', function() require('hover').hover_switch('next') end, { desc = 'hover (next)' })
		end,
	},
}
