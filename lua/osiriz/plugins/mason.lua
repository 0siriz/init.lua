return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { { 'mason-org/mason.nvim', opts = {} } },
    opts = {
      ensure_installed = {
        'autopep8',
        'bash-language-server',
        'clang-format',
        'clangd',
        'docker-compose-language-service',
        'dockerfile-language-server',
        'goimports',
        'gopls',
        'html-lsp',
        'isort',
        { 'lua-language-server', version = '3.15.0' },
        'python-lsp-server',
        'tinymist',
        'typescript-language-server',
        'tree-sitter-cli',
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 5,
    },
  },
}
