local fd = vim.uv.fs_scandir(vim.fn.stdpath('config') .. '/lua/osiriz/lsp')
if fd == nil then
  return
end

for file in function() return vim.uv.fs_scandir_next(fd) end do
  local name, _ = file:gsub('%.lua$', '')

  vim.lsp.config(name, require('osiriz.lsp.' .. name))
  vim.lsp.enable(name)
end
