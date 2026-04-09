local lsps = {
  'bashls',
  'clangd',
  'docker_language_server',
  'gopls',
  'html',
  'lua_ls',
  'pylsp',
  'tinymist',
  'ts_ls',
}

for _, name in ipairs(lsps) do
  vim.lsp.config(name, require('osiriz.lsp.' .. name))
  vim.lsp.enable(name)
end
