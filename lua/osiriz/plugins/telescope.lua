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
		event = { 'VeryLazy' },
		config = function()
			local telescope = require('telescope')
			local builtin = require('telescope.builtin')

			telescope.setup({
				extensions = {
					fzf = {
						fuzzy = true,
					},
				},
			})

			telescope.load_extension('fzf')

			vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
			vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
			vim.keymap.set('n', '<leader>sm', builtin.man_pages, { desc = '[S]earch [M]an pages' })
			vim.keymap.set('n', '<leader>ds', builtin.diagnostics, { desc = '[D]iagnostic [S]earch' })
		end
	},
}
