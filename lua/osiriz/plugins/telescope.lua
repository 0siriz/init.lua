return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'folke/which-key.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
			},
		},
		opts = {
			extensions = {
				fzf = {
					fuzzy = true,
				},
			},
		},
		keys = {
			{ '<leader>?', function() require('telescope.builtin').oldfiles() end, desc = '[?] Find recently opened files' },
			{ '<leader><space>', function() require('telescope.builtin').buffers() end, desc = '[ ] Find existing buffers' },
			{ '<leader>sf', function() require('telescope.builtin').find_files() end, desc = '[S]earch [F]iles' },
			{ '<leader>sh', function() require('telescope.builtin').help_tags() end, desc = '[S]earch [H]elp' },
			{ '<leader>sm', function() require('telescope.builtin').man_pages() end, desc = '[S]earch [M]an pages' },
			{ '<leader>sd', function() require('telescope.builtin').diagnostics() end, desc = '[S]earch [D]iagnostic' },
		},
	},
}
