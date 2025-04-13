return {
	{
		'folke/flash.nvim',
		event = { 'VeryLazy' },
		opts = {
			modes = {
				search = { enabled = true },
				char = { enabled = true },
			},
		},
		keys = {
			{ 's', function() require('flash').jump() end, mode = { 'n', 'x', 'o' }, desc = 'Flash' },
			{ 'S', function() require('flash').treesitter() end, mode = { 'n', 'x', 'o' }, desc = 'Flash Treesitter' },
			{ 'r', function() require('flash').remote() end, mode = { 'o' }, desc = 'Remote Flash' },
			{ 'R', function() require('flash').treesitter_search() end, mode = { 'o', 'x' }, desc = 'Treesitter Search' },
			{ '<c-s>', function() require('flash').toggle() end, mode = { 'c' }, desc = 'Toggle Flash Search' },
		},
	},
}
