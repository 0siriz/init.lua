return {
	{
		'folke/persistence.nvim',
		event = { 'BufReadPre' },
		opts = {},
		keys = {
			{ '<leader>pl', function() require('persistence').load() end, desc = '[P]ersistence [L]oad Session' },
			{ '<leader>ps', function() require('persistence').select() end, desc = '[P]ersistence [S]elect Session' },
			{ '<leader>pd', function() require('persistence').stop() end, desc = '[P]ersistence [D]isable' }
		},
	},
}
