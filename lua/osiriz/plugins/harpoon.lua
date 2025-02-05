return {
	{
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		opts = {},
		keys = {
			{ '<leader>hm', function() require('harpoon'):list():add() end, desc = '[H]arpoon [M]ark file' },
			{ '<leader>hu', function() require('harpoon'):list():remove() end, desc = '[H]arpoon [U]nmark file' },
			{ '<leader>hp', function() require('harpoon'):list():prev() end, desc = '[H]arpoon [P]revious mark' },
			{ '<leader>hn', function() require('harpoon'):list():next() end, desc = '[H]arpoon [N]ext mark' },
			{
				'<leader>hf',
				function()
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

					toggle_telescope(require('harpoon'):list())
				end,
				desc = '[H]arpoon [F]ind mark'
			},
		},
	},
}
