-- Unmap some defaults
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grx')
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'grt')

-- LSP
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover' })
