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
			ensure_installed = {
				'bash',
				'c',
				'c_sharp',
				'cpp',
				'css',
				'dockerfile',
				'editorconfig',
				'go',
				'html',
				'javascript',
				'json',
				'lua',
				'markdown',
				'markdown_inline',
				'powershell',
				'python',
				'yaml',
			},
			highlight = { enable = true },
			indent = { enable = true },
		}
	},
}
