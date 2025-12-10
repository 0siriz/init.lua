function binexists(bin)
  return vim.fn.executable(bin) == 1
end

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { { 'mason-org/mason.nvim', opts = {} } },
    opts = {
      ensure_installed = {
        {
          'autopep8',
          condition = function()
            return not binexists('autopep8') and binexists('pip')
          end
        },
        {
          'bash-language-server',
          condition = function()
            return not binexists('bash-language-server') and binexists('npm')
          end
        },
        {
          'clang-format',
          condition = function()
            return not binexists('clang-format') and binexists('pip')
          end
        },
        {
          'clangd',
          condition = function()
            return not binexists('clangd')
          end
        },
        {
          'docker-language-server',
          condition = function()
            return not binexists('docker-language-server')
          end
        },
        {
          'goimports',
          condition = function()
            return not binexists('goimports') and binexists('go')
          end
        },
        {
          'gopls',
          condition = function()
            return not binexists('gopls') and binexists('go')
          end
        },
        {
          'html-lsp',
          condition = function()
            return not binexists('vscode-html-language-server') and binexists('npm')
          end
        },
        {
          'isort',
          condition = function()
            return not binexists('isort') and not binexists('pip')
          end
        },
        {
          'lua-language-server',
          condition = function()
            return not binexists('lua-language-server')
          end
        },
        {
          'python-lsp-server',
          condition = function()
            return not binexists('pylsp') and binexists('pip')
          end
        },
        {
          'tinymist',
          condition = function()
            return not binexists('tinymist')
          end
        },
        {
          'typescript-language-server',
          condition = function()
            return not binexists('typescript-language-server') and binexists('npm')
          end
        },
        {
          'tree-sitter-cli',
          condition = function()
            return not binexists('tree-sitter')
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
