return {
	{
		'nvim-lualine/lualine.nvim',
		event = { 'VeryLazy' },
		dependencies = {
			'letieu/harpoon-lualine',
		},
		opts = {
			options = {
				theme = 'auto',
				globalstatus = true,
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { { 'harpoon2', no_harpoon = '' } },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' },
			},
		},
	},
}
