return {
	{
		'j-hui/fidget.nvim',
		tag = 'v1.6.0',
		event = { 'VeryLazy' },
		opts = {
			notification = {
				override_vim_notify = true,
			},
		},
		keys = {
			{ '<leader>sn', function() require('telescope').extensions.fidget.fidget() end, desc = '[S]earch [N]otifications' },
		},
	},
}
