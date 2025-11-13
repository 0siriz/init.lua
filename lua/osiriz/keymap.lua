-- LSP
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })

-- Foldcolumn
vim.keymap.set('n', '<leader>tf', function()
  if vim.o.foldcolumn == '0' then
    vim.o.foldcolumn = 'auto:9'
  else
    vim.o.foldcolumn = '0'
  end
end, { desc = 'Toggle Foldcolumn' })
