return {
	{
		'folke/which-key.nvim',
		event = { 'VeryLazy' },
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'echasnovski/mini.icons',
		},
		opts = {
			spec = {
				{
					{ '<leader>c', desc = '[C]ode', mode = { 'n', 'x' } },
					{ '<leader>d', desc = '[D]ocument' },
					{ '<leader>g', desc = '[G]it', mode = { 'n', 'x' }},
					{ '<leader>h', desc = '[H]arpoon' },
					{ '<leader>r', desc = '[R]ename' },
					{ '<leader>s', desc = '[S]earch' },
					{ '<leader>w', desc = '[W]orkspace' },
					{ '<leader>p', desc = '[P]ersistence' },
				}
			}
		},
	},
}
