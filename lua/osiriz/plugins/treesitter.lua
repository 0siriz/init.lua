return {
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects'
		},
		build = ':TSUpdate',
		main = 'nvim-treesitter.configs',
		events = { 'VeryLazy' },
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
		}
	},
}
