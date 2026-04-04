local Binexists = require('osiriz.mods.utils').binexists

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { { 'mason-org/mason.nvim', opts = {}, }, },
    opts = {
      ensure_installed = {
        {
          'autopep8',
          condition = function()
            return not Binexists('autopep8') and Binexists('pip')
          end
        },
        {
          'bash-language-server',
          condition = function()
            return not Binexists('bash-language-server') and Binexists('npm')
          end
        },
        {
          'clang-format',
          condition = function()
            return not Binexists('clang-format') and Binexists('pip')
          end
        },
        {
          'clangd',
          condition = function()
            return not Binexists('clangd')
          end
        },
        {
          'docker-language-server',
          condition = function()
            return not Binexists('docker-language-server')
          end
        },
        {
          'goimports',
          condition = function()
            return not Binexists('goimports') and Binexists('go')
          end
        },
        {
          'gopls',
          condition = function()
            return not Binexists('gopls') and Binexists('go')
          end
        },
        {
          'html-lsp',
          condition = function()
            return not Binexists('vscode-html-language-server') and Binexists('npm')
          end
        },
        {
          'isort',
          condition = function()
            return not Binexists('isort') and Binexists('pip')
          end
        },
        {
          'lua-language-server',
          version = '3.16.4', -- Pinned due to lazydev.nvim issue with global vim
          condition = function()
            return not Binexists('lua-language-server')
          end
        },
        {
          'python-lsp-server',
          condition = function()
            return not Binexists('pylsp') and Binexists('pip')
          end
        },
        {
          'tinymist',
          condition = function()
            return not Binexists('tinymist')
          end
        },
        {
          'typescript-language-server',
          condition = function()
            return not Binexists('typescript-language-server') and Binexists('npm')
          end
        },
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 5,
    },
  },
}
