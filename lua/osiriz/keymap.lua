-- LSP
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover' })
