return {
	{
		'stevearc/resession.nvim',
		config = function()
			local resession = require('resession')
			resession.setup({})

			vim.api.nvim_create_autocmd('VimLeavePre', {
				callback = function()
					resession.save(vim.fn.getcwd(), { notify = false })
				end,
			})

			vim.api.nvim_create_autocmd('VimEnter', {
				callback = function()
					if vim.fn.argc(-1) == 0 then
						resession.load(vim.fn.getcwd(), { silence_errors = true })
					end
				end,
				nested = true,
			})
		end
	}
}

