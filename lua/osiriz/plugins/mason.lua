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
            return not Binexists('autopep8')
          end
        },
        {
          'bash-language-server',
          condition = function()
            return not Binexists('bash-language-server')
          end
        },
        {
          'clang-format',
          condition = function()
            return not Binexists('clang-format')
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
            return not Binexists('goimports')
          end
        },
        {
          'gopls',
          condition = function()
            return not Binexists('gopls')
          end
        },
        {
          'golangci-lint',
          condition = function()
            return not Binexists('golangci-lint')
          end
        },
        {
          'golangci-lint-langserver',
          condition = function()
            return not Binexists('golangci-lint-langserver')
          end
        },
        {
          'html-lsp',
          condition = function()
            return not Binexists('vscode-html-language-server')
          end
        },
        {
          'isort',
          condition = function()
            return not Binexists('isort')
          end
        },
        {
          'lua-language-server',
          condition = function()
            return not Binexists('lua-language-server')
          end
        },
        {
          'openscad-lsp',
          condition = function()
            return not Binexists("openscad-lsp")
          end
        },
        {
          'python-lsp-server',
          condition = function()
            return not Binexists('pylsp')
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
            return not Binexists('typescript-language-server')
          end
        },
        {
          'prettypst',
          condition = function()
            return not Binexists('prettypst')
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
