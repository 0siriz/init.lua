return {
	{
		'cbochs/grapple.nvim',
		event = { 'VeryLazy' },
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		opts = {},
		keys = {
			{ '<leader>at', function() require('grapple').tag() end, desc = 'Gr[a]pple [T]ag File' },
			{ '<leader>au', function() require('grapple').untag() end, desc = 'Gr[a]pple [U]ntag File' },
			{ '<leader>ap', function() require('grapple').cycle_tags('prev') end, desc = 'Gr[a]pple [P]revious Tag' },
			{ '<leader>an', function() require('grapple').cycle_tags('next') end, desc = 'Gr[a]pple [N]ext Tag' },
			{ '<leader>af', function() require('telescope').extensions.grapple.tags() end, desc = 'Gr[a]pple [F]ind Tag' },
		}
	},
}
