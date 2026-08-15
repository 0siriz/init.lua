local lsps = {
  'bashls',
  'clangd',
  'docker_language_server',
  'golangci_lint_ls',
  'gopls',
  'html',
  'lua_ls',
  'openscad_lsp',
  'pylsp',
  'tinymist',
  'ts_ls',
}

for _, name in ipairs(lsps) do
  vim.lsp.config(name, require('osiriz.lsp.' .. name))
  vim.lsp.enable(name)
end

local complete_client = function(arg)
  return vim.iter(vim.lsp.get_clients()):map(function(client)
    return client.name
  end):filter(function(name)
    return name:sub(1, #arg) == arg
  end):totable()
end

local complete_config = function(arg)
  return vim.iter(vim.lsp.get_configs()):map(function(client)
    return client.name
  end):filter(function(name)
    return name:sub(1, #arg) == arg
  end):totable()
end

vim.api.nvim_create_user_command('LspInfo', ':checkhealth vim.lsp', { desc = 'Alias to `:checkhealth vim.lsp`' })
vim.api.nvim_create_user_command('LspLog', function()
  vim.cmd(string.format('tabnew %s', vim.lsp.log.get_filename()))
end, {
  desc = 'Opens the Nvim LSP client log.',
})

vim.api.nvim_create_user_command('LspStart', function(info)
  local servers = info.fargs

  if #servers == 0 then
    local filetype = vim.bo.filetype
    for _, config in pairs(vim.lsp.get_configs()) do
      local filetypes = config.filetypes
      if filetypes and vim.tbl_contains(filetypes, filetype) then
        table.insert(servers, config.name)
      end
    end
  end

  vim.lsp.enable(servers)
end, {
  desc = 'Enabled and launch a language server',
  nargs = '?',
  complete = complete_config,
})

vim.api.nvim_create_user_command('LspRestart', function(info)
  local client_names = info.fargs

  if #client_names == 0 then
    client_names = vim.iter(vim.lsp.get_clients()):map(function(client)
      return client.name
    end):totable()
  end

  for name in vim.iter(client_names) do
    if vim.lsp.config[name] == nil then
      vim.notify(("Invalid server name %s"):format(name))
    else
      vim.lsp.enable(name, false)
      if info.bang then
        vim.iter(vim.lsp.get_clients({ name = name })):each(function(client)
          client:stop(true)
        end)
      end
    end
  end

  local timer = assert(vim.uv.new_timer())
  timer:start(500, 0, function()
    for name in vim.iter(client_names) do
      vim.schedule_wrap(vim.lsp.enable)(name)
    end
    timer:close()
  end)
end, {
  desc = 'Restart the given client',
  nargs = '?',
  bang = true,
  complete = complete_client,
})

vim.api.nvim_create_user_command('LspStop', function(info)
  local client_names = info.fargs

  if #client_names == 0 then
    client_names = vim.iter(vim.lsp.get_clients()):map(function(client)
      return client.name
    end):totable()
  end

  for name in vim.iter(client_names) do
    if vim.lsp.config[name] == nil then
      vim.notify(("Invalid server name %s"):format(name))
    else
      vim.lsp.enable(name, false)
      if info.bang then
        vim.iter(vim.lsp.get_clients({ name = name })):each(function(client)
          client:stop(true)
        end)
      end
    end
  end
end, {
  desc = 'Disable and stop the given client',
  nargs = '?',
  bang = true,
  complete = complete_client,
})
