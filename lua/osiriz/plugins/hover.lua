return {
	{
		'patrickpichler/hovercraft.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		opts = function()
			return {
				providers = {
					providers = {
						{ 'LSP', require('hovercraft.provider.lsp.hover').new() },
						{ 'Man', require('hovercraft.provider.man').new() },
						{ 'Git Blame', require('hovercraft.provider.git.blame').new() },
					}
				},

				window = {
					border = 'single',
				},

				keys = {
					{ '<C-d>', function() require('hovercraft').scroll({ delta = 4 }) end },
					{ '<C-u>', function() require('hovercraft').scroll({ delta = -4 }) end },
					{ '<tab>', function() require('hovercraft').hover_next() end },
					{ '<S-tab>', function() require('hovercraft').hover_next({ step = -1 }) end },
				},
			}
		end,
		keys = {
			{
				'K',
				function()
					local hovercraft = require('hovercraft')
					if hovercraft.is_visible() then
						hovercraft.enter_popup()
					else
						hovercraft.hover()
					end
				end,
				desc = 'Hover',
			},
		},
	},
}
