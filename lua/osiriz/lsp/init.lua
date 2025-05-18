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

-- TODO: See if there is a smart way to do this
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

for name, config in pairs(configs) do
  config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, config.capabilities or {})
  vim.lsp.config(name, config)
  table.insert(servers, name)
end

vim.lsp.enable(servers)
