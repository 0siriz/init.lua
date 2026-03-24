-- Edit Register
vim.api.nvim_create_user_command('RegEdit', function(opts)
  local reg = opts.args ~= '' and opts.args or '"'
  require('osiriz.mods.register').edit_register(reg)
end, {
  nargs = '?',
})
