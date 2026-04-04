local M = {}

function M.binexists(bin)
  return vim.fn.executable(bin) == 1
end

return M
