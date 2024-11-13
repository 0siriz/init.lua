return {
	{
		'folke/todo-comments.nvim',
		event = { 'VeryLazy' },
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim'
		},
		config = function()
			vim.keymap.set('n', ']t', require('todo-comments').jump_next, { desc = 'Next todo comment' })
			vim.keymap.set('n', '[t', require('todo-comments').jump_prev, { desc = 'Previous todo comment' })
			vim.keymap.set('n', '<leader>st', require('telescope').extensions['todo-comments'].todo, { desc = '[S]earch [T]odo comments' })

			require('todo-comments').setup({
				signs = false,
			})
		end,
	},
}
