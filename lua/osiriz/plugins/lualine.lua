return {
	{
		'nvim-lualine/lualine.nvim',
		event = { 'VeryLazy' },
		opts = {
			options = {
				theme = 'auto',
				globalstatus = true,
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'grapple' },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' },
			},
		},
	},
}
