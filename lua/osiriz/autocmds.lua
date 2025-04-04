-- Number toggle
local numbertogglegroup = vim.api.nvim_create_augroup('numbertoggle', {})

vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave', 'WinEnter' }, {
	pattern = '*',
	group = numbertogglegroup,
	callback = function()
		if vim.o.nu and vim.api.nvim_get_mode().mode ~= 'i' then
			vim.opt.relativenumber = true
		end
	end,
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'CmdlineEnter', 'WinLeave' }, {
	pattern = '*',
	group = numbertogglegroup,
	callback = function(event)
		if vim.o.nu then
			vim.opt.relativenumber = false
			if event.event == 'CmdlineEnter' then
				vim.cmd('redraw')
			end
		end
	end
})

-- Cmd Height
local cmdheightgroup = vim.api.nvim_create_augroup('cmdheight', {})

vim.api.nvim_create_autocmd({ 'CmdlineEnter', 'RecordingEnter' }, {
	pattern = '*',
	group = cmdheightgroup,
	callback = function()
		vim.opt.cmdheight = 1
	end
})

vim.api.nvim_create_autocmd({ 'CmdlineLeave', 'RecordingLeave' }, {
	pattern = '*',
	group = cmdheightgroup,
	callback = function()
		vim.opt.cmdheight = 0
	end
})
