return {
	{
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		events = { 'VeryLazy' },
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim'
		},
		config = function()
			local harpoon = require('harpoon')
			harpoon:setup()

			local conf = require('telescope.config').values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require('telescope.pickers').new({}, {
					prompt_title = 'Harpoon',
					finder = require('telescope.finders').new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				}):find()
			end

			vim.keymap.set('n', '<leader>hm', function() harpoon:list():add() end, { desc = '[H]arpoon: [M]ark file' })
			vim.keymap.set('n', '<leader>hu', function() harpoon:list():remove() end, { desc = '[H]arpoon: [U]nmark file'})
			vim.keymap.set('n', '<leader>hp', function() harpoon:list():prev() end, { desc = '[H]arpoon: [P]revious mark'})
			vim.keymap.set('n', '<leader>hn', function() harpoon:list():next() end, { desc = '[H]arpoon: [N]ext mark'})
			vim.keymap.set('n', '<leader>hf', function() toggle_telescope(harpoon:list()) end, { desc = '[H]arpoon: [F]ind mark'})
		end
	},
}
