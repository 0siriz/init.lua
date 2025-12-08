-- Shorter version of willothy/wezterm.nvim
local M = {
  switch_pane = {},
  switch_tab = {},
}

local fmt = string.format

local function exit_handler(msg)
  return function(obj)
    if obj.code ~= 0 then
      vim.notify(
        'Wezterm failed to ' .. msg .. '\nstdout:\n' .. obj.stdout .. '\nstderr:\n' .. obj.stderr,
        vim.log.levels.ERROR,
        { title = 'Wezterm' }
      )
    end
  end
end

function M.exec(args, handler, stdin)
  vim.system({ 'wezterm', unpack(args) }, {
    stdin = stdin,
    text = true,
  }, vim.schedule_wrap(handler))
end

function M.exec_sync(args)
  local rv = vim.system({ 'wezterm', unpack(args) }, {
    text = true,
  }):wait()

  return rv.code == 0, rv.stdout, rv.stderr
end

function M.split_pane(opts)
  opts = opts or {}
  local args = { 'cli', 'split-pane' }

  if opts.cwd then
    table.insert(args, '--cwd')
    table.insert(args, opts.cwd)
  end

  if opts.cells then
    table.insert(args, '--cells')
    table.insert(args, fmt('%d', opts.cells))
  elseif opts.percent then
    table.insert(args, '--percent')
    table.insert(args, fmt('%d', opts.percent))
  end

  if opts.top then
    table.insert(args, '--top')
  elseif opts.right then
    table.insert(args, '--right')
  elseif opts.bottom then
    table.insert(args, '--bottom')
  elseif opts.left then
    table.insert(args, '--left')
  end

  if opts.top_level then
    table.insert(args, '--top-level')
  end

  if opts.program then
    table.insert(args, '--')
    for _, arg in ipairs(opts.program) do
      table.insert(args, arg)
    end
  end

  M.exec(args, exit_handler('split-pane'))
end

function M.spawn(opts)
  opts = opts or nil
  local args = { 'cli', 'spawn' }

  if opts.new_window then
    table.insert(args, '--new-window')
  end

  if opts.cwd then
    table.insert(args, '--cwd')
    table.insert(args, opts.cwd)
  end

  if opts.program then
    table.insert(args, '--')
    for _, arg in ipairs(opts.program) do
      table.insert(args, arg)
    end
  end

  M.exec(args, exit_handler('spawn'))
end

function M.switch_pane.direction(dir)
  dir = dir:sub(1, 1):upper() .. dir:sub(2, -1)
  local args = { 'cli', 'activate-pane-direction', dir }

  M.exec(args, exit_handler('activate pane by direction'))
end

function M.switch_pane.id(id)
  local args = { 'cli', 'activate-pane', '--pane-id', fmt('%d', id) }
  M.exec(args, exit_handler('activate pane by id'))
end

function M.switch_tab.relative(relno)
  local args = { 'cli', 'activate-tab', '--tab-relative', fmt('%d', relno) }
  M.exec(args, exit_handler('activate tab relative'))
end

function M.switch_tab.index(index)
  local args = { 'cli', 'activate-tab', '--tab-index', fmt('%d', index) }
  M.exec(args, exit_handler('activate tab by index'))
end

function M.switch_tab.id(id)
  local args = { 'cli', 'activate-tab', '--tab-id', fmt('%d', id) }
  M.exec(args, exit_handler('activate tab by id'))
end

return M
