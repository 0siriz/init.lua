return {
	{
		'willothy/moveline.nvim',
		event = { 'VeryLazy' },
		build = 'make',
		config = function()
			local moveline = require('moveline')
			vim.keymap.set('n', 'K', moveline.up, { desc = 'Move line up' })
			vim.keymap.set('n', 'J', moveline.down, { desc = 'Move line down' })
			vim.keymap.set('v', 'K', moveline.block_up, { desc = 'Move block up' })
			vim.keymap.set('v', 'J', moveline.block_down, { desc = 'Move block down' })
		end
	},
}
