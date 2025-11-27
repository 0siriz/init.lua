return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        variant = 'main',
        dark_variant = 'main',
        highlight_groups = {
          -- nvim-cmp
          CmpItemKindIcon = { link = 'CmpItemKind' },
          CmpItemKindClassIcon = { link = 'CmpItemKindClass' },
          CmpItemKindFunctionIcon = { link = 'CmpItemKindFunction' },
          CmpItemKindInterfaceIcon = { link = 'CmpItemKindInterface' },
          CmpItemKindMethodIcon = { link = 'CmpItemKindMethod' },
          CmpItemKindSnippetIcon = { link = 'CmpItemKindSnippet' },
          CmpItemKindVariableIcon = { link = 'CmpItemKindVariable' },

          -- Fidget
          FidgetGroupSeparator = { fg = 'subtle' },
          FidgetNormal = { fg = 'subtle' },
          FidgetGroup = { link = 'Title' },
          FidgetIcon = { link = 'Special' },
          FidgetAnnote = { link = 'Question' },
          FidgetDebug = { fg = 'muted' },
          FidgetInfo = { fg = 'foam' },
          FidgetWarn = { fg = 'gold' },
          FidgetError = { fg = 'love' },

          -- Flash
          FlashBackdrop = { fg = 'subtle' },
          FlashPromptIcon = { fg = 'gold' },
        }
      })
      vim.cmd.colorscheme('rose-pine')
    end
  },
}
