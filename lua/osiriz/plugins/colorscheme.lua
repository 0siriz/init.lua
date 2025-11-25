return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        variant = 'main',
        dark_variant = 'main',
        highlight_groups = {
          CmpItemKindIcon = { link = 'CmpItemKind' },
          CmpItemKindClassIcon = { link = 'CmpItemKindClass' },
          CmpItemKindFunctionIcon = { link = 'CmpItemKindFunction' },
          CmpItemKindInterfaceIcon = { link = 'CmpItemKindInterface' },
          CmpItemKindMethodIcon = { link = 'CmpItemKindMethod' },
          CmpItemKindSnippetIcon = { link = 'CmpItemKindSnippet' },
          CmpItemKindVariableIcon = { link = 'CmpItemKindVariable' },
        }
      })
      vim.cmd.colorscheme('rose-pine')
    end
  },
}
