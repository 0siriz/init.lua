local configs = {
  bashls = require('osiriz.lsp.bashls'),
  clangd = require('osiriz.lsp.clangd'),
  docker_compose_language_service = require('osiriz.lsp.docker_compose_language_service'),
  dockerls = require('osiriz.lsp.dockerls'),
  gopls = require('osiriz.lsp.gopls'),
  html = require('osiriz.lsp.html'),
  lua_ls = require('osiriz.lsp.lua_ls'),
  pylsp = require('osiriz.lsp.pylsp'),
  ts_ls = require('osiriz.lsp.ts_ls')
}

local servers = {}

for name, config in pairs(configs) do
  vim.lsp.config(name, config)
  table.insert(servers, name)
end

vim.lsp.enable(servers)
