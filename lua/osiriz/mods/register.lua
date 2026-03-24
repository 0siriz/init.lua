local M = {}

function M.edit_register(reg)
  reg = reg or '"'

  local content = vim.fn.getreg(reg)
  local regtype = vim.fn.getregtype(reg)

  local buf = vim.api.nvim_create_buf(false, true)

  local lines = vim.split(content, "\n", { plain = true })
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local width = math.min(120, vim.o.columns - 10)
  local height = math.min(30, vim.o.lines - 10)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    title = ("Editing register '%s'"):format(reg),
    title_pos = 'center',
  })

  vim.keymap.set('n', '<CR>', function()
    local new_content = table.concat(vim.api.nvim_buf_get_lines(buf, 0, -1, false), "\n")
    vim.fn.setreg(reg, new_content, regtype)
    vim.notify(("Register '%s' updated"):format(reg), vim.log.levels.INFO)
    vim.api.nvim_win_close(win, true)
  end, { noremap = true, silent = true, buffer = buf })

  vim.keymap.set('n', '<Esc>', function()
    vim.api.nvim_win_close(win, true)
  end, { noremap = true, silent = true, buffer = buf })
end

return M
